From: David Howells <dhowells@redhat.com>
Date: Tue, 17 Jul 2012 19:35:30 +0000
Subject: Re: [modsign:modsign 23/27] kernel/module-verify.c:63:15: warning: unused variable 'secsize'
Message-Id: <28879.1342553730@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717174217.GA5545@localhost>
In-Reply-To: <20120717174217.GA5545@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> There are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign
> head:   88883f815418ff31af0e71ece672656ef75a5e88
> commit: 0e3a9d4eb0e62a7133409aaf371f82dedf57bc9e [23/27] MODSIGN: Check the ELF container
> 
> All warnings:
> 
> kernel/module-verify.c: In function 'module_verify_elf':
> kernel/module-verify.c:63:15: warning: unused variable 'secsize' [-Wunused-variable]

Okay.  Dealt with that.  The fix was in the next patch.

The new version is pushed and will appear at some point when kernel.org feels
like it.

David
