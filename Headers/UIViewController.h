/** <title>UIWindow</title>

   <abstract>The window class</abstract>

   Copyright (C) 2011 Free Software Foundation, Inc.

   Author: Gregory Casamento
   Date: January 2011

   This file is part of the GNUstep UIKit/Mobile Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; see the file COPYING.LIB.
   If not, see <http://www.gnu.org/licenses/> or write to the 
   Free Software Foundation, 51 Franklin Street, Fifth Floor, 
   Boston, MA 02110-1301, USA.
*/

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "UIResponder.h"

@class UIView;

@interface UIViewController : UIResponder
{
  UIView *view;
  CGSize contentSizeForViewInPopover;
  BOOL editing;
  BOOL hidesBottomBarWhenPushed;
  UIInterfaceOrientation interfaceOrientation;
  BOOL modalInPopover;
  UIModalPresentationStyle modalPresentationStyle;
  UIModalTransitionStyle modalTransitionStyle;
  UIViewController *modalViewController;
  UINavigationController *navigationController;
  UINavigationItem *navigationItem;
  NSBundle *nibBundle;
  NSString *nibName;
  UIViewController *parentViewController;
  UISearchDisplayController *searchDisplayController;
  UISplitViewController *splitViewController;
  UITabBarController *tabBarController;
  UITabBarItem *tabBarItem;
  NSString *title;
  NSArray *toolbarItems;
  BOOL wantsFullScreenLayout;
}

/*
 * Properties...
 */
- (void) setIsEditing: (BOOL)flag;
- (BOOL) isEditing;
- (void) setView: (UIView *)aView;
- (UIView *) view;
- (void) setContentSizeForViewInPopover: (CGSize)size;
- (CGSize) contentSizeForViewInPopover;
- (void) setHidesBottomBarWhenPushed: (BOOL)flag;
- (BOOL) hidesBottomBarWhenPushed;
- (UIInterfaceOrientation) interfaceOrientation;
- (void) setModelInPopover: (BOOL)flag;
- (BOOL) isModalInPopover;
- (void) setModalPresentationStyle: (UIModalPresentationStyle)style;
- (UIModalPresentationStyle) modalPresentationStyle;
- (void) setModalPresentationStyle: (UIModalTransitionStyle)style;
- (UIModalTransitionStyle) modalPresentationStyle;
- (void) setModalViewController: (UIViewController *)aViewController;
- (UIViewController *) modalViewController;
- (void) setNavigationController: (UINavigationController *)aViewController;
- (UINavigationController *) navigationController;
- (void) setNavigationController: (UINavigationItem *)aViewController;
- (UINavigationItem *) navigationController;
- (void) setNibBundle: (NSBundle *)bundle;
- (NSBundle *)nibBundle;
- (void) setNibName: (NSString *)name;
- (NSString *) nibName;
- (void) setParentViewController: (UIViewController *)aViewController;
- (UIViewController *) parentViewController;

/*
 * Methods
 */

@end
