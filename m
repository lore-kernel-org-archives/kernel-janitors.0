From: Radu Voicilas <radu@picohost.net>
Date: Sat, 05 Dec 2009 02:19:29 +0000
Subject: Coding style questions
Message-Id: <4B19C331.3080805@picohost.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1. When you have a function prototype with a comment following it (which obviously it's a bad thing), like this one

u32 eprom_read(struct net_device *dev,u32 addr); //reads a 16 bits word

and want to fix it, how would one do it:

/* Read a 16 bits word. */
u32 eprom_read(struct net_device *dev, u32 addr);

or the comment should go into the implementation file ?

2. What's the kernel code style about header guards ? As far as I've seen, it's usual to do:

#ifndef HEADER_H
#define HEADER_H

and not:

#infdef _HEADER_H
#define _HEADER_H

or other variations. Does it even matter?


Thanks,
Radu.
