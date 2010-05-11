From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 11 May 2010 17:10:18 +0000
Subject: Re: [PATCH] kbuild/makefiles.txt: Correct documentation section 3.3
Message-Id: <20100511101018.9e60b7b8.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100511073015.GC15995@haskell.muteddisk.com>
In-Reply-To: <20100511073015.GC15995@haskell.muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 11 May 2010 00:30:15 -0700 matt mooney wrote:

> Update section 3.3 Loadable module goals - obj-m, from
> $(<module_name>-objs) to $(<module_name>-y) for easier addition of
> conditional objects to the module. The examples are also updated to
> reflect the current state of each Makefile used.

Hi,

Please also send all 3 of your patches to
  linux-kbuild@vger.kernel.org
so that the (current) kernel build people can see/review them.

Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
