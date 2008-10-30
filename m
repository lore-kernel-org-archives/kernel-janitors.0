From: "Mulyadi Santosa" <mulyadi.santosa@gmail.com>
Date: Thu, 30 Oct 2008 18:32:11 +0000
Subject: Re: Confusion about unused variable warnings during kernel build.
Message-Id: <f284c33d0810301132q665756ax30ab9cb18d9b29ea@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
In-Reply-To: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi man...

On Wed, Oct 29, 2008 at 1:21 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> Hi,
>
> Occasionally during kernel builds I get some unused variable warnings.
> But when I go and check the code the variable is getting used.
> Interestingly I have seen this problem only with the file symbols
> exported from fs/locks.c. An example of such errors is
>
> fs/lockd/svclock.c:719: warning: unused variable 'file'
> fs/nfsd/nfsxdr.c:154: warning: unused variable 'dentry'
> fs/nfsd/nfs4state.c:1626: warning: unused variable 'flp'
>
> Is there some problem with the way symbols are exported ?? Out of the
> above 3, 2 of them are exported as EXPORT_SYMBOL_GPL and one of them
> as EXPORT_SYMBOL

My best guess so far is: probably they "seem" not being used because
they are just variable that are not really being used and end up
simply exported? or perhaps they are "aliased" (not sure if I use
correct term...it's kinda using pointer that simply points to them or
something like them).

regards,

Mulyadi.
