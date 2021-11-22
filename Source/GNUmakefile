#
#  Main makefile for GNUstep GUI Library
#  Copyright (C) 1997 Free Software Foundation, Inc.
#
#  Author: Scott Christley <scottc@net-community.com>
#
#  This file is part of the GNUstep UIKit Library.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; see the file COPYING.LIB.
#  If not, see <http://www.gnu.org/licenses/> or write to the 
#  Free Software Foundation, 51 Franklin Street, Fifth Floor, 
#  Boston, MA 02110-1301, USA.

PACKAGE_NAME = gnustep-mobile
GNUSTEP_LOCAL_ADDITIONAL_MAKEFILES=../mobile.make
include $(GNUSTEP_MAKEFILES)/common.make

include ../Version
include ../config.make

# Interface version changes with each minor release
libgnustep-mobile_INTERFACE_VERSION=${GNUSTEP_GUI_MAJOR_VERSION}.${GNUSTEP_GUI_MINOR_VERSION}

srcdir = .
PACKAGE_NAME = gnustep-mobile
LIBRARY_VAR = GNUSTEP_MOBILE

# The library to be compiled
LIBRARY_NAME = libgnustep-mobile

# The Objective-C source files to be compiled
libgnustep-mobile_C_FILES =

# The Objective-C source files to be compiled
libgnustep-mobile_OBJC_FILES = \

libgnustep-mobile_HEADER_FILES_DIR = ../Headers/Additions/GNUstepGUI
libgnustep-mobile_HEADER_FILES_INSTALL_DIR = /GNUstepGUI

UIKIT_HEADERS = \

MOBILE_HEADERS = \

libgnustep-mobile_HEADER_FILES = ${MOBILE_HEADERS}

HEADERS_INSTALL = ${UIKIT_HEADERS} \
                  ${MOBILE_HEADERS} 

# Resources
RESOURCE_SET_NAME = libmobile-resources
libmobile-resources_INSTALL_DIR = $(GNUSTEP_LIBRARY)/Libraries/gnustep-mobile/Versions/$(libgnustep-mobile_INTERFACE_VERSION)/Resources
libmobile-resources_RESOURCE_DIRS =
libmobile-resources_RESOURCE_FILES = Info-gnustep.plist


# Extra DLL exports file
libgnustep-mobile_DLL_DEF = libgnustep-mobile.def

include GNUmakefile.preamble

include $(GNUSTEP_MAKEFILES)/library.make
include $(GNUSTEP_MAKEFILES)/resource-set.make

include GNUmakefile.postamble

include CompatibilityHeaders.make
