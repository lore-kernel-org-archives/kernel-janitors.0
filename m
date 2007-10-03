From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 03 Oct 2007 14:50:41 +0000
Subject: "#ifdef __KERNEL__" and user-space headers
Message-Id: <Pine.LNX.4.64.0710031047360.31616@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm curious -- is there a standard for protecting the contents of
header files that aren't even exported to user space?  for example, in
include/linux/string.h:


#ifndef _LINUX_STRING_H_
#define _LINUX_STRING_H_

/* We don't want strings.h stuff being user by user stuff by accident
*/

#ifdef __KERNEL__
... etc etc ...

  but according to include/linux/Kbuild, that header file isn't
exported to userspace, anyway.  so the "#ifdef __KERNEL__" doesn't
technically hurt, but it's kind of redundant, no?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
