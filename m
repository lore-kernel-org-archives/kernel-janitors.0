From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Oct 2018 09:26:54 +0000
Subject: Re: [PATCH] wireless: airo: potential buffer overflow in sprintf()
Message-Id: <CAOQ4uxiZ9bee_s+4=C1w03Jn475KZ=qJszvM+dnAP4kWwNJKRA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181024083334.a6pxsifew3iztuun@kili.mountain>
 <87sh0vsox6.fsf@codeaurora.org> <20181024090721.uxgwo6h6p3h6u5vp@mwanda> <87o9bjsno8.fsf@codeaurora.org>
In-Reply-To: <87o9bjsno8.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, johannes.berg@intel.com, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 24, 2018 at 12:23 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
> > On Wed, Oct 24, 2018 at 11:56:53AM +0300, Kalle Valo wrote:
> >> Dan Carpenter <dan.carpenter@oracle.com> writes:
> >>
> >> > It looks like we wanted to print a maximum of BSSList_rid.ssidLen bytes
> >> > of the ssid, but we accidentally use "%*s" (width) instead of "%.*s"
> >> > (precision) so if the ssid doesn't have a NUL terminator this could lead
> >> > to an overflow.
> >> >
> >> > Fixes: e174961ca1a0 ("net: convert print_mac to %pM")
> >> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> > ---
> >> > Static analsysis.  Not tested.
> >>
> >> IMHO this part (after "---" line) is important information and should be
> >> part of commit log. I can fix that.
> >>
> >
> > In my experience most maintainers disagree (with varying degrees of
> > intensity).
>
> Heh, why would adding four words explaining the background of the patch
> to a commit log would be a bad thing? :) Well, I guess I just view
> things differently.
>

By the time a maintainer applies a patch and requests to merge it upstream
the patch should be tested. Right?
So how would a comment "Not tested" make any sense in an upstream
merged patch?

Thanks,
Amir.
