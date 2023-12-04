Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd5nxUVx"
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34E8AC
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 05:11:36 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3333074512bso1700229f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695495; x=1702300295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7CvBb5ez2rIHJbMByjNRmxDcnijZJnzjRDM0SVuuo8=;
        b=dd5nxUVxQaJnV3E51oxOIgChhhlRYhyjPNgo/meQd8WlJkTSElmihMnt2JD7t3KIM8
         aELRsVSgxLqD0hGrByfBVBtNwbVDrWLJyaXbPYVO41YAQcGFVNBRhEUjAqHVA/VQg6t8
         3qdJzaVR/u2iwh4xPKEqYbpKIq+qCCp33BkoUro4yyky11xpGncNNEb1ZqKBdjYN73nQ
         ZkrvaDEeS8hBKoiCpexbw9Q4z17RBfBoGxO2FkRV2dEPdfcMV82zl+8QhZyf+xnIK8O9
         Dwh90uncsZmUUfjn/JbY310iuN50N7lrkSALWmkBKXtWsZYzKBw9WuCPWvNh67r9xE0J
         LJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695495; x=1702300295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7CvBb5ez2rIHJbMByjNRmxDcnijZJnzjRDM0SVuuo8=;
        b=IV0UxKQTGvYel2bdRbnyKiSL2tE6UG7/r9qqL3G0tj+75H7lb/HPJKJp2xVqZ4A/j+
         DHzNUJisItF3/VXOc1gFX90z7nqr+m+MHGaGv/HEwOZzKvSt49v1ul3if/HDF2fiZI8h
         4P813rvdijthbjnVqyKx2FJSnmXjrppSONP5YoAYmFM9ReWu67xO/D99LESgHfvcggnV
         ESpsUpWR9G2vXeFDfE4/tgSB89yCDdU1/mFOHYyRLs+V2MyZhOlqMdTrzo1RS/612yHA
         69nP+PJQtomrFjd0LRf3i089MPg4Q3Twjyqw3D+85JyLzRpRqdrPSd9BNdmsvRs1XoPJ
         DJJw==
X-Gm-Message-State: AOJu0Yxk64JtJ39FjnQWD6+G1NtIwcmPlmwg5HmTamvtA6aWgJYs/ud+
	dH/RO9oNpus4UVgWLmIMxcEN+g==
X-Google-Smtp-Source: AGHT+IHw4m55StfKreagQZR9FEW5SpMZuKW7wPpRItxPU+RJscZo0a8NGKblqE4YoqlOtE3KO/Q3zg==
X-Received: by 2002:a05:600c:4fd2:b0:40b:5e56:7b47 with SMTP id o18-20020a05600c4fd200b0040b5e567b47mr2967883wmq.144.1701695495247;
        Mon, 04 Dec 2023 05:11:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c311200b0040b42df75fcsm15017507wmo.39.2023.12.04.05.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:11:34 -0800 (PST)
Date: Mon, 4 Dec 2023 16:11:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Su Hui <suhui@nfschina.com>, alexander.usyskin@intel.com,
	tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Message-ID: <bd13cda0-6437-40fa-a73a-9770be6f0167@suswa.mountain>
References: <20231128014507.418254-1-suhui@nfschina.com>
 <2023120452-stool-party-bf2b@gregkh>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023120452-stool-party-bf2b@gregkh>

On Mon, Dec 04, 2023 at 09:00:42AM +0100, Greg KH wrote:
> > diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> > index 7ea80779a0e2..0489bec4fded 100644
> > --- a/drivers/misc/mei/client.c
> > +++ b/drivers/misc/mei/client.c
> > @@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
> >  	hbuf_slots = mei_hbuf_empty_slots(dev);
> >  	if (hbuf_slots < 0) {
> >  		rets = -EOVERFLOW;
> > -		goto out;
> > +		goto err;
> 
> Please prove that this is correct, as based on the code logic, it seems
> very wrong.  I can't take this unless the code is tested properly.

Hi Greg,

When Su Hui sent the v2 patch you sent an auto response about adding
stable to the CC list.
https://lore.kernel.org/all/2023112042-napped-snoring-b766@gregkh/

However, it appears that you still applied the v2 patch.  It's in
linux-next as commit ee6236027218 ("misc: mei: client.c: fix problem of
return '-EOVERFLOW' in mei_cl_write").

When I use `git am` to apply this patch, then it doesn't apply.  However,
when I use cat email.txt | patch -p1 then it tries to reverse the patch
and apply it to a different function.

So this a kind of confusing thing.

regards,
dan carpenter
