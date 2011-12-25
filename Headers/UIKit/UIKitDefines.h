/* Platform specific definitions for externs
   Copyright (C) 2001,2011 Free Software Foundation, Inc.

   Written by:  Adam Fedor <fedor@gnu.org>
   Date: Jul, 2001
   Written by: Ivan Vucica <ivan@vucica.net>
   Date: Dec, 2011
   
   This file is part of the GNUstep UIKit Library.

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

#ifndef __UIKitDefines_INCLUDE
#define __UIKitDefines_INCLUDE
#import <GNUstepBase/GSVersionMacros.h>

#ifdef GNUSTEP_WITH_DLL 

#if BUILD_libgnustep_uikit_DLL
#
# if defined(__MINGW32__)
  /* On Mingw, the compiler will export all symbols automatically, so
   * __declspec(dllexport) is not needed.
   */
#  define UIKIT_EXPORT  extern
#  define UIKIT_DECLARE 
# else
#  define UIKIT_EXPORT  __declspec(dllexport)
#  define UIKIT_DECLARE __declspec(dllexport)
# endif
#else
#  define UIKIT_EXPORT  extern __declspec(dllimport)
#  define UIKIT_DECLARE __declspec(dllimport)
#endif

#else /* GNUSTEP_WITH[OUT]_DLL */

#  define UIKIT_EXPORT extern
#  define UIKIT_DECLARE

#endif

#ifdef __clang__
#  define PACKAGE_SCOPE @package
#else
#  define PACKAGE_SCOPE @public
#endif

#endif /* __UIKitDefines_INCLUDE */
