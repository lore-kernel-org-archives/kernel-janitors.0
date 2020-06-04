From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 04 Jun 2020 07:25:04 +0000
Subject: Re: [PATCH][next] ovl: fix null pointer dereference on null stack pointer on error return
Message-Id: <CAJfpegsyGmJYHJr8rmRTxScYGyNQ1ZdPMxprW1zoQmGhXg1wuA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603154559.140418-1-colin.king@canonical.com>
 <CAOQ4uxhLW=MSk=RhUi51EdOticfk1i_pku6qjCp2QpwnpyL5sw@mail.gmail.com> <1edc291d-6e63-89d8-d48c-443908ddc0e8@canonical.com>
In-Reply-To: <1edc291d-6e63-89d8-d48c-443908ddc0e8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Amir Goldstein <amir73il@gmail.com>, overlayfs <linux-unionfs@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Jun 3, 2020 at 6:15 PM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 03/06/2020 17:11, Amir Goldstein wrote:
> > On Wed, Jun 3, 2020 at 6:46 PM Colin King <colin.king@canonical.com> wrote:
> >>
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> There are two error return paths where the call to path_put is
> >> dereferencing the null pointer 'stack'.  Fix this by avoiding the
> >> error exit path via label 'out_err' that will lead to the path_put
> >> calls and instead just return the error code directly.
> >>
> >> Addresses-Coverity: ("Dereference after null check)"
> >> Fixes: 4155c10a0309 ("ovl: clean up getting lower layers")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >
> >
> > Which branch is that based on?
> > Doesn't seem to apply to master nor next
>
> It was based on today's linux-next

Yeah, it's actually

Fixes: 73819e26c0f0 ("ovl: get rid of redundant members in struct ovl_fs")

So I'll just fold your patch.  There's still a change in the loop
count for later errors, but that's okay, since
ovl_lower_dir()/ovl_mount_dir_noesc() use the path_put_init() variant.
Actually ovl_lower_dir() can get rid of that path_put_init()
completely, since now the only caller will take care of that...

Thanks for reporting!

Miklos
