From: Tomas Melin <tomas.melin@iki.fi>
Date: Fri, 04 May 2012 16:22:12 +0000
Subject: Re: [PATCH 3/3] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <CACraW2pmC3=SyzdObz_vTM35PTmLA6zpAM5yungggnmC_Z2Rxg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336056543-4625-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1336056543-4625-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, May 4, 2012 at 4:19 PM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
> On Thu, May 03, 2012 at 05:49:03PM +0300, Tomas Melin wrote:
>> Removed one additional level of if() by combining two if() statements in=
to one.
>>
>
> The patch looks good obviously.
>
> All three redone patches have the same subject. =A0It would be better
> if it were:
>
> [patch 1/4] Staging: Comedi adv_pci1710: move a check forward
> [patch 2/4] Staging: Comedi adv_pci1710: fix some line breaks
> [patch 3/4] Staging: Comedi adv_pci1710: clarify some comments
> [patch 4/4] Staging: Comedi adv_pci1710: combine two conditions
>
> I kind of feel bad for being nit-picky like this... =A0It's just that
> it's your first few patches so you may as well learn what we look
> for.

Thanks for the pointers, it's good to get feedback. Trying to get a
grasp of the patching process to eventually be able to do something
meaningful ;)

regards,
Tomas
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
