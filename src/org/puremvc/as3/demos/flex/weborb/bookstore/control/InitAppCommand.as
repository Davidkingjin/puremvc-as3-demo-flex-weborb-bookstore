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
	
	import org.puremvc.interfaces.ICommand;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.command.SimpleCommand;

	public class InitAppCommand extends SimpleCommand implements ICommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy( new BookProxy() );
			//...
			

			var app:PureMVCExample = notification.getBody() as PureMVCExample;

			facade.registerMediator( new BooksPanelMediator( app.booksPanel ) );
			facade.registerMediator( new BookFormMediator( app.bookForm ) );
			//...
			
			sendNotification(ApplicationFacade.GET_BOOKS);
		
		}
		
	}
}