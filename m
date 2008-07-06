From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 20:29:36 +0000
Subject: Re: [PATCH] x86 setup.c: cleanup includes
Message-Id: <a4423d670807061329m6b9dfd69if2e48aa7b3be599b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a4423d670807060913red9187bj7bcc886d1fb20ad3@mail.gmail.com>
	 <20080706105840.90ac5219.randy.dunlap@oracle.com>
In-Reply-To: <20080706105840.90ac5219.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: mingo@elte.hu, yhlu.kernel@gmail.com, tglx@linutronix.de, hpa@zytor.com, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2008/7/6 Randy Dunlap <randy.dunlap@oracle.com>:
> Did you do these manually (by personal inspection) or by some tool?
> If a tool, what tool/where is it?  Thanks.

It is a simple script like this:

find . -name "*.h" -exec grep.sh {} \;
find . -name "*.c" -exec grep.sh {} \;

grep.sh:
#!/bin/sh
grep -H "^#include" $1|sed "s,/\*.\+,,"|grep -v ":$"|sort|uniq -c|grep
-v "^ \+1:"

I have found about 70-80 double inclusions, but most of them have
reason for that and can not be removed.
