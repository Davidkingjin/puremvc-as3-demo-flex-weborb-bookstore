/* 
 PureMVC AS3 Demo - Flex/WebORB Bookstore
 By David Deraedt <david.deraedt@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.weborb.bookstore.control
{
	import org.puremvc.as3.demos.flex.weborb.bookstore.ApplicationFacade;
	import org.puremvc.as3.demos.flex.weborb.bookstore.model.BookProxy;
	import org.puremvc.as3.demos.flex.weborb.bookstore.view.BookFormMediator;
	import org.puremvc.as3.demos.flex.weborb.bookstore.view.BooksPanelMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class InitAppCommand extends SimpleCommand implements ICommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy( new BookProxy() );
			//...
			

			var app:Bookstore = notification.getBody() as Bookstore;

			facade.registerMediator( new BooksPanelMediator( app.booksPanel ) );
			facade.registerMediator( new BookFormMediator( app.bookForm ) );
			//...
			
			sendNotification(ApplicationFacade.GET_BOOKS);
		
		}
		
	}
}