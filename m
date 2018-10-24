From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Oct 2018 09:23:51 +0000
Subject: Re: [PATCH] wireless: airo: potential buffer overflow in sprintf()
Message-Id: <87o9bjsno8.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181024083334.a6pxsifew3iztuun@kili.mountain>
        <87sh0vsox6.fsf@codeaurora.org>
        <20181024090721.uxgwo6h6p3h6u5vp@mwanda>
In-Reply-To: <20181024090721.uxgwo6h6p3h6u5vp@mwanda> (Dan Carpenter's message
        of "Wed, 24 Oct 2018 12:07:21 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, Oct 24, 2018 at 11:56:53AM +0300, Kalle Valo wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> 
>> > It looks like we wanted to print a maximum of BSSList_rid.ssidLen bytes
>> > of the ssid, but we accidentally use "%*s" (width) instead of "%.*s"
>> > (precision) so if the ssid doesn't have a NUL terminator this could lead
>> > to an overflow.
>> >
>> > Fixes: e174961ca1a0 ("net: convert print_mac to %pM")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> > Static analsysis.  Not tested.
>> 
>> IMHO this part (after "---" line) is important information and should be
>> part of commit log. I can fix that.
>> 
>
> In my experience most maintainers disagree (with varying degrees of
> intensity).

Heh, why would adding four words explaining the background of the patch
to a commit log would be a bad thing? :) Well, I guess I just view
things differently.

-- 
Kalle Valo
