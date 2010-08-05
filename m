From: Changli Gao <xiaosuo@gmail.com>
Date: Thu, 05 Aug 2010 13:59:52 +0000
Subject: Re: [patch] isdn: fix information leak
Message-Id: <AANLkTi=Pi6dyQ+NE-DW66hQKVLDD992DokqExaOb5o-0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100805093806.GF9031@bicker> <AANLkTin4jtYuaxYfxDAgST857sD2K4Q28mPcPW=xd-V3@mail.gmail.com>
	<20100805101938.GH9031@bicker> <AANLkTi=8ThVqTHpQmDfoon02C-VZ0JwBRtSrU7dzvvNt@mail.gmail.com>
	<20100805113721.GI9031@bicker> <AANLkTikGNr8aVV7Rryq_dvSuYjUbEo_gRDLW3d49YwF-@mail.gmail.com>
	<20100805134910.GJ9031@bicker>
In-Reply-To: <20100805134910.GJ9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2010 at 9:55 PM, Dan Carpenter <error27@gmail.com> wrote:
> First of all, I'm happy that you're reviewing these patches. =A0A lot of
> learner, often untested, patches go through kernel-janitors and the
> entire purpose of the list is to check each other's work.
>
> Here is what I meant by an information leak. =A0The original code did:
> =A0 =A0 =A0 =A0spid =3D kmalloc(SCIOC_SPIDSIZE, GFP_KERNEL);
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0strcpy(spid, rcvmsg->msg_data.byte_array);
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0if (copy_to_user(data->dataptr, spid, SCIOC_SPIDSIZE)) {
>
> When you allocate memory with kmalloc() it doesn't clear that memory. =A0=
It
> could have anything in there including passwords etc. =A0If there is a
> short string in "rcvmsg->msg_data.byte_array" like "123" then the
> strcpy() puts that in the first 4 bytes of "spid", but the rest of the
> buffer is still full of passwords.
>
> The copy_to_user() sends it to the user, and normally the user only reads
> as far as the terminator, but if they read past that then they would see
> all the passwords etc that were saved there.
>
> This function is in the ioctl() probably only root has open() permission
> on the device so it's not a big deal because root can already find your
> password. =A0But I didn't dig that far. =A0It's just simpler to zero out =
the
> memory instead of worrying about if it really is exploitable or not.
>
> Also it's quite possible that the strcpy can't overflow. =A0But it's weird
> for the code to leave space for the terminator and then not use it. =A0In
> the end, I decided to do the cautious thing and be done with it.
>

Thanks, Dan. I got it.

--=20
Regards,
Changli Gao(xiaosuo@gmail.com)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
