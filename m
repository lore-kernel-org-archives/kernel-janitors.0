Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807841F5F3
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208635; cv=none; b=lnpq4iXDPccUlnWbXhkVVEv4x85EkrTq+j7F06cjGjytq3naNtUo3DkqDyfME/i/D/jPLxEWVgaP6cbJixbgr3bJo/CWVJ5fg/XZ7DSq6+iMW150OF45TxqYrAZdFA3GgISCxVlrVbNxsEgEtjSpYu+yge+vq95GzHn8H7HbBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208635; c=relaxed/simple;
	bh=WB6mu1i3NewQ+i2LFqeE0E/NcGweHadEcPFk8ntwrEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/gGbOPs2fN9ALykcO6m87NMGSWaiVBK0N5WL/Sg3i7W/1xznB0rRVES2T6o3YeZjN0qDcmwlzSFpKxMfI5Y40r8yTTDuK/k+hJEyjPoTTRmyMng5h7WAPw2MkOXDyUpmXbWr0iTbdT5pxGMizjIPnZ2Wjnb9uKz/MU1WT1+q6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oizErKJs; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oizErKJs"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9f829d75aso2029863a34.0
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784208633; x=1784813433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7TYuXzoNqDH2nR/xpl074QpxuDI0hlYBZ5yt21l508=;
        b=oizErKJsj4adiBXTxWdWxGvJBWd7U6JVhwAKQtsC4fiHw3XSyc84Pv8fnIXjju3gW0
         LFY1b7NUjo4aAfUr9Gzge24YquM8EJYwge+0VG5H6mpolijVV+dgcc1qnlSekni33j76
         1/pkb0s7oPsHJFiVOp/wot+ewVF/OjWL0q8/C23tPa5qAKc1i2kecqkTP1ecJffpRnWn
         VwHhLSc3JuZ4D3ZuTQGHoMavbwELFF3450Gk8W5qskMA38qXTd6nVBpyRC3M6wQLavTC
         qv1wPWn93CK8lZmZMeyGy4KBOqWR6d6XTs5a78nUoK0chcgQy2yP58A3yUCfkp7r6HJw
         m/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208633; x=1784813433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f7TYuXzoNqDH2nR/xpl074QpxuDI0hlYBZ5yt21l508=;
        b=ZMYmrIvtAItSUNlHqxaEnequqLxsBqIJjHW8qqmWn4qM99BLhQv7LEUL/YBNMvOVnx
         ui9oJbFXFv/Rp0e9PiTmgy5vrev8Fm4iCchtcVzBcFRlSeqHx0qMVz2R4abohaj6mM2c
         0bqoMrmWDm8hXmAi9oQSgdGNcFRCBK/dS4kFlEflmryVce6OtT9Wwlyorvo1omp42VZ8
         Jmu5Hc1i+F3SlGa9KCgEBR7Gut0JUbCgbDRtfT+iOt/gaOK/jBNzMac+GWz5/jieA79B
         frBbnjM6FwWtBIM3kWIJoYckgTwJdIQv4ZVozps06WXNMFWh9J1te2K1EcKi+2F2lIDD
         KyQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3UrXpNpQH9/1ntdmFIah2AxtQJ6ZxCsODukkrDsSHizOLx+3LVYQGnneG2R+lPWWapJlfgfUKWI8uw65AGm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1zlz/dxC/aCpwiNkoxHD1QhaW8LgmcxofvH7ZZgt6DVLE2NI
	9G67GKD51eDZof3lc+E+8KyAZ4429S+zBDYf2mT8DAYZtCHhDwiuOP43
X-Gm-Gg: AfdE7ckbLsofNqikIdKS6SjOE1brHNfFJMVqQLK0raGKilwU8Cj8nzxYLSG3T780phR
	A7d9oKKF90/4Y4zt5upcI2+/rEOmRGdgEKApWT+olVYt9iLsxLxyxpi8YLf4K3cLDV1UMLzde/o
	38IdfSppMBbYzMTEv4fl/7fl2CqK71ec5p95c8pUZX/ZmH2OnJOzfLIOjltuxpUk9/HK2aqcCK8
	6OJkSeVII14Tmqx1ODsgP1P/K9Vr7qMmWena45Od8sTjbsbDE4zOXaLNWxw76OdKSl5KVckKPp6
	c1RS4Vs+oChjV8TD4e5NfeaBqEbpXbxjtxTJ08pjiayYP3F7nJRBzgK1Ng92LHkm+NPeznMcJbp
	nAMqRgv6REki6E3Kg0T6CegXuDsqIMF9YXRFtirYRdkHUxF2h/3Pd4vOd99XKB2o+sVW8FuQ+b5
	pMTeOc
X-Received: by 2002:a05:6820:1508:b0:6a2:e7df:c4ea with SMTP id 006d021491bc7-6a39a85a39cmr12923260eaf.65.1784208633146;
        Thu, 16 Jul 2026 06:30:33 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a83ecc4sm16678950eaf.11.2026.07.16.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:30:32 -0700 (PDT)
Date: Thu, 16 Jul 2026 16:30:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Michael Grzeschik <mgr@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Yibo Dong <dong100@mucse.com>, LKML <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: net: rnpgbe: Pass an expression directly in rnpgbe_rm_adapter()
Message-ID: <aljc8RRt8OuYz90H@stanley.mountain>
References: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>
 <alScHkiC3EmGzOlI@stanley.mountain>
 <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>
 <aliA1EIIrX82jGR-@stanley.mountain>
 <320cb00c-28f8-4871-9ec5-d9b86cca8bc9@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <320cb00c-28f8-4871-9ec5-d9b86cca8bc9@web.de>

On Thu, Jul 16, 2026 at 10:20:42AM +0200, Markus Elfring wrote:
> >>>> The address of a data structure member was determined before
> >>>> a corresponding null pointer check in the implementation of
> >>>> the function “rnpgbe_rm_adapter”.
> >>>>
> >>>> Thus avoid the risk for undefined behaviour by omitting the variable “hw”.
> >>>> Pass the required address directly to a function call.
> >>>>
> >>>> This issue was detected by using the Coccinelle software.
> >>>>
> >>>> Fixes: 2ee95ec17e97c58b65e978a08b75fa8cb6424e4e ("net: rnpgbe: Add register_netdev")
> >>>
> >>> There is no NULL dereference here.  It's just pointer math.
> >>> No need for a Fixes tag.
> >>
> >> How does your view fit to information in an article like “Fun with NULL pointers, part 1”
> >> (by Jonathan Corbet from 2009-07-20)?>> https://lwn.net/Articles/342330/
> >>
> > 
> > Of course you can't have NULL pointer dereferences but this is not a
> > dereference, it's just pointer math.
> Does your understanding of programming language details differ from the view
> by Jonathan Corbet?

Jonathan Corbet's article talks about dereferences.

	p = tun->sk;
            ^^^^^^^
This is a dereference.

	p = &tun->sk;
            ^
This is pointer math.  It's not a dereference.

regards,
dan carpenter


