From: =?ISO-8859-1?Q?Kevyn=2DAlexandre_Par=E9?=
Date: Fri, 23 Oct 2009 18:46:24 +0000
Subject: Write and Submit Your First Kernel Patch
Message-Id: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

Hi,

Just before I send my patch I got this error with:
./scripts/checkpatch.pl --terse --file
0001-Staging-comedi-driver-fix-coding-style.patch

0001-Staging-comedi-driver-fix-coding-style.patch:27: ERROR: trailing whitespace
0001-Staging-comedi-driver-fix-coding-style.patch:35: ERROR: trailing whitespace
0001-Staging-comedi-driver-fix-coding-style.patch:43: ERROR: trailing whitespace
0001-Staging-comedi-driver-fix-coding-style.patch:53: ERROR: trailing whitespace

I have done a step by step explanation of what I have done:
http://kapare.blogspot.com/2009/09/write-and-submit-your-first-kernel.html

It seem to me that the whitespace are added after I do this command:
git format-patch -s -n master..mybranch

Can someone help me with that because google did help me to found the answer?

Thx

kap
