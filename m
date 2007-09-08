From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 08 Sep 2007 00:35:28 +0000
Subject: some version_string() magic i'm not aware of?
Message-Id: <Pine.LNX.4.64.0709072033570.10879@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm puzzled by this snippet from init/version.c:

...
#define version(a) Version_ ## a
#define version_string(a) version(a)

int version_string(LINUX_VERSION_CODE);
...

puzzled because this appears to be the only place in the entire tree
that uses the macro version_string().  so is there some reason it even
exists, as opposed to just using version() as it's defined there?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
