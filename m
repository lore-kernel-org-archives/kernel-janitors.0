Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C331A808;
	Fri, 16 Jan 2026 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554888; cv=none; b=K+DaXbxTPv9ZtvKz7xj5v62l/n7PIEHJXJ4kl6lO/9U9R+lSPgMVZyQ9zOU/46Uz9F/+vUjxPzEIvRIIZfHz88eIE8CtBcPUfgPWCGOJqoFtH/JTO01rBX+C2W82D7lUcTg/wcB5yeRfYnpfsIiWEvJhsiMLZj3K+Zf0JA2uRho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554888; c=relaxed/simple;
	bh=3SamNIJ/Are+C/I+gqv+kznrE4CPCwmYFAwFwqjSDhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqJaBgpgRmmxEM6qFObyvHCe1G9CaJe68A5s9X5G6VeHDjS8LJdE069M+lwOKsHojo7cxOWQXkx+SVU5CxeYLi7mG51BTO4wevmm7DmzSpfdyQ5zoyYnPnbj9dCwPQCF9arRtE73gO2DUzlXhvf7NcI4FsAhZ9jTNm5PsSv+bEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBOSwZ5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBOSwZ5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E00C116C6;
	Fri, 16 Jan 2026 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554888;
	bh=3SamNIJ/Are+C/I+gqv+kznrE4CPCwmYFAwFwqjSDhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBOSwZ5/znT4C3v7d3val0FA0srjWpwq2c1lnkV9kPW4CdGeKGAOWHSHL0dAD3hKW
	 lnMvkezyjk00lbbHQ2VCEGKaD6Zlr0JFsv8Nv3LkZ6YT4oFh0JpluhmMIk7Kfq/8Ry
	 gzNCPFVyqYOcPSKT6E3LtbUx7pRwFIJh3iAA8QP9ybnMj9sdWc89n9CQ67vB+ZLP0T
	 X4gIr8FHD/LhcNOzZ/uf05vxH5NahwftBDSoffvzms4lIxLyn+VeAhauLnjtuqgr7q
	 pE5FzMT+6CR3EBSGUAqS257iwqVowOak41fCjWOLj088GXxELM7JklDWaRx0/P1FPY
	 KcncNqSygFH5w==
Date: Fri, 16 Jan 2026 14:44:42 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Colin King <coking@nvidia.com>
Cc: ryan foster <foster.ryan.r@gmail.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] optee: make read-only array attr static const
Message-ID: <aWoBgt66shtVTovl@sumit-xelite>
References: <20260109154442.421248-1-coking@nvidia.com>
 <aWTaUvGu9dlvnJO9@sumit-xelite>
 <CAHtS329G-H8vVVr==DZUAetzVNc4couN2OV3tH7qH_7YDGe8xA@mail.gmail.com>
 <DS0PR12MB8294F8C07E39842AC16CBA21AF81A@DS0PR12MB8294.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR12MB8294F8C07E39842AC16CBA21AF81A@DS0PR12MB8294.namprd12.prod.outlook.com>

On Mon, Jan 12, 2026 at 03:24:49PM +0000, Colin King wrote:
> I added this change for several reasons, it's read-only so making it const is always sensible.  Making it static means we don't get the compiler to generate object code that stores the array on the stack (each time it's called) and then index into it, instead the data is put into a read-only data section at compile timne and the object code just fetched data from this array.
> 
> Basically, if it's read-only it's good to make it const and it's not in an __init section then you may as well make it static const. It's scoped inside the function, even though it's in the data section.
> 

That's fair. I don't have a strict preference here. Feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> ________________________________
> From: ryan foster <foster.ryan.r@gmail.com>
> Sent: 12 January 2026 14:46
> To: Sumit Garg <sumit.garg@kernel.org>
> Cc: Colin King <coking@nvidia.com>; Jens Wiklander <jens.wiklander@linaro.org>; op-tee@lists.trustedfirmware.org <op-tee@lists.trustedfirmware.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH][next] optee: make read-only array attr static const
> 
> This looks like a micro-optimization, const makes the lookup array
> explicitly immutable, and static keeps it out of the stack frame,
> avoiding per-call initialization.
> 
> Is there a style preference for read only lookup arrays here, e.g.
> Should these variables remain local but not static, or should they be
> moved to file scope static const?
> 
> On Mon, Jan 12, 2026 at 3:26 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Fri, Jan 09, 2026 at 03:44:42PM +0000, Colin Ian King wrote:
> > > Don't populate the read-only array attr on the stack at run
> > > time, instead make it static const.
> >
> > Is there any value add to do this? AFAIK, the static local variables
> > aren't preffered.
> >
> > -Sumit
> >
> > >
> > > Signed-off-by: Colin Ian King <coking@nvidia.com>
> > > ---
> > >  drivers/tee/optee/rpc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > index 97fc5b14db0c..1758eb7e6e8b 100644
> > > --- a/drivers/tee/optee/rpc.c
> > > +++ b/drivers/tee/optee/rpc.c
> > > @@ -43,7 +43,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
> > >       struct i2c_msg msg = { };
> > >       size_t i;
> > >       int ret = -EOPNOTSUPP;
> > > -     u8 attr[] = {
> > > +     static const u8 attr[] = {
> > >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> > >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> > >               TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > > --
> > > 2.51.0
> > >
> >
