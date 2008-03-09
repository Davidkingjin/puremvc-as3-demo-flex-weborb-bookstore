/* 
 PureMVC AS3 Demo - Flex/WebORB Bookstore
 By David Deraedt <david.deraedt@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.demos.flex.weborb.bookstore
{
	import org.puremvc.as3.interfaces.IFacade;

	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;	

	import org.puremvc.as3.demos.flex.weborb.bookstore.controller.*;

	public class ApplicationFacade extends Facade implements IFacade
	{
		
		public static const STARTUP:String 			= "startup";	
		public static const CREATE_BOOK:String 		= "createBook";	
		public static const GET_BOOKS:String 		= "getBooks";					
		public static const UPDATE_BOOK:String 		= "updateBook";			
		public static const DELETE_BOOK:String 		= "deleteBook";	
		public static const BOOK_SELECTED:String 	= "bookSelected";							
		public static const BOOK_DELETED:String 	= "bookDeleted";
		
		public static function getInstance() : ApplicationFacade {

			if ( instance == null ) instance = new ApplicationFacade( );

			return instance as ApplicationFacade;

		}		
		
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand(STARTUP, 		StartupCommand); 
			registerCommand(CREATE_BOOK, 	CreateBookCommand);			
			registerCommand(GET_BOOKS, 		GetBooksCommand);			
			registerCommand(UPDATE_BOOK, 	UpdateBookCommand);						
			registerCommand(DELETE_BOOK, 	DeleteBookCommand);
			
		}

		public function startup( app:Bookstore ):void
		{			
			sendNotification( STARTUP, app );
		}
		
	}
}