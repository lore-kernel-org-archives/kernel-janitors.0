From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Wed, 29 Oct 2008 06:33:20 +0000
Subject: Confusion about unused variable warnings during kernel build.
Message-Id: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Occasionally during kernel builds I get some unused variable warnings.
But when I go and check the code the variable is getting used.
Interestingly I have seen this problem only with the file symbols
exported from fs/locks.c. An example of such errors is

fs/lockd/svclock.c:719: warning: unused variable 'file'
fs/nfsd/nfsxdr.c:154: warning: unused variable 'dentry'
fs/nfsd/nfs4state.c:1626: warning: unused variable 'flp'

Is there some problem with the way symbols are exported ?? Out of the
above 3, 2 of them are exported as EXPORT_SYMBOL_GPL and one of them
as EXPORT_SYMBOL

Thanks -
Manish
