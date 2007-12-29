/* 
 PureMVC AS3 Demo - Flex/WebORB Bookstore
 By David Deraedt <david.deraedt@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.weborb.bookstore.control
{

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	import org.puremvc.interfaces.ICommand;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.command.SimpleCommand;

	import org.puremvc.as3.demos.flex.weborb.bookstore.business.LibraryDelegate;
	import org.puremvc.as3.demos.flex.weborb.bookstore.model.BookProxy;

	public class GetBooksCommand extends SimpleCommand implements ICommand, IResponder
	{
		
		override public function execute(notification:INotification):void
		{
			
			var delegate:LibraryDelegate = new LibraryDelegate(this);
			delegate.getBooks();
			
		}
		
		public function result(data:Object):void
		{
			var bookList:Array = data.result as Array;
			var bookProxy:BookProxy = facade.retrieveProxy(BookProxy.NAME) as BookProxy;
			bookProxy.books.source = bookList;
		}
		
		public function fault(info:Object):void
		{
			Alert.show((info as FaultEvent).toString());
		}
		
	}
}