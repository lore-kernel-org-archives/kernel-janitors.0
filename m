Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3184D6C3D
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771803; cv=pass; b=TTJNPACiWaldAa6QbYhbLucJNfISlZga1w3j8RffNiw35Vdu1TsWdmSLNCbaCm8ze4djzaAWhImOtXEmGjMTTOqKkLkqW3qKb7zrjoUrP+H1tJYRZsS3t29dSEoL9Ov1IuqA7GE3A/5lWpOHLQOQb6jlUpx34jpEcZLMQ3XzJhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771803; c=relaxed/simple;
	bh=RZzbWSIjgew6wFLJXJB540VLEgS01esjSjMrQti3Bdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxkGKsUeXSjkMAaDWNXM2GrQsENvX5Vuhzms1bvasCYqyMeoPQsMbW6ennLVFcK8YQi4oHu1Gh8BRc6AhSnDg8l4tXlTXM89Q8pvDRLlIXEApitpV+dIf71dZJ1Tki+U75jf0rJGjld4JlWUOFwm38HF+nIFPxIaMTWVNQs++s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFUAWwpx; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFUAWwpx"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so1447793d50.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Sep 2026 05:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771798; cv=none;
        d=google.com; s=arc-20260327;
        b=AlVXmkFcVEL2xk/v07wsxsaabS5R9qc+CGne9bvxzIKkm/YHE7Tb9MZW5RFGAP13RV
         r24IOpPbZ57WiKzrw+OqGDsCkz70gORkjn8uQD5/gEyM/W5129CcAU5XwzOpP0wQ5znL
         3HmiQE+MG/nQLQkLfRcOhv3K3BxSyo8h19PQ+JskwdqerZFEIitnUZsSHTQP8Xr7ucXi
         AQ6GyBJjZUc/8IyXEgUFDTVqqmbo0Jtu5bMir1DCRPXPg5ntppeqfhb7kKowTrJqo3ub
         KqIHHEveAnQZhXnMopf14RIG4HVm7k8hEgUXdWDbylTK3eJpm0DyBaiLad331J9GlJU2
         ByWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        fh=AT2FKDmCp/NDVGOLmKFvQOp9lwh045l8avtJ1FqdthQ=;
        b=YQ38ktwAvLh1ajD5t0M12xVCicdWIQ8mbQUYPGOSy6nEFC8ut1JaaLEZXvrcedoo6B
         unNeNrscyTic0Z02uXFZkk/uOfsYJCAvE4cNqPuqjvM/aUMiiCOt8wM5oit3eUeFL1Af
         WJfz3TXVUpty3FztI3Buj9MwNFZVV//p33MOUHLwfUZOOAOee1mW7FIl2t6qAA4OzwCr
         CpSsO430RTzueBSNdhbe9cWKPouLjQyi+usSAJhkAXwytOWXxLA6HgarAxygANfnXDoT
         gSdvm6VhR5hm58kHWC1jxvFDw2aLlAlAi7eczKGkU1+VTwS5LfcvIhGCLwjDJL7co7Iq
         Ywpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771798; x=1791376598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=PFUAWwpxNVvoPpL968Pb8klzGZoDvFMcmc/qjkL3jOCzDfaqtEGBir6MNK67BXFeFD
         QZpUSbUMM4sJD2OV71f602feOvoskCzQDQdVIkfmFuUcQcMOXknakedYngeHUGP1+Yz4
         Ig/+pzR2mFzdQVeW/LfCDQfyMAIzQ5Tqj8kiNiy4qjM9HIaiL8IU1JDq5wZA9Vq2trij
         cS7JjZhUOmfGCKQperMi4noQreYOqEYzGP4GJJe+WlZ8LEhRkuyTp5FIZDQ+nbt/onau
         55yTPK4B9GRMg8hpVgu2FReGBboX+593W/SW+lS0OW6/V39xZ2gfZEdo8ntqNapaSNpt
         TAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771798; x=1791376598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=zVsW3EyuwWVELMBObKh0+EdE1OphPy8lqGZNlzJByf0dAItdyvxQGd6KBnNVyeG9oU
         PONnIZO7M/6E8DfsfdYWIjUmjuVO+MJZ6v8YeXRUiJ2yajfd/gfP8NI2HouUglKywKiZ
         UsGqKVeFxlPx33SnO8s152CjL1HLl1i95qhHohOrQJ6XMvec6ee2tGJKho3v02ztx1lJ
         hCg6tVVsqyK7zrUw/uC9B1EshEyGaxDJjITNPPb/7P99/nFLOQD0S9HruKqA87LcThCz
         ZWFXFGjZtAPjHSoGK0LCkTc8czwGlNIFcW8IHJxtmwFCsY1AXUtlXhJe/H6X0UxlL57j
         ZyUQ==
X-Forwarded-Encrypted: i=1; AKwUvByADMWGIFm7q77HCdOemb/7J307duYVfGHJNJqgiN+u2rXks5Vhh0gW7rlc+lmrFDGi8HiGkKvsr99LLpW53b4=@vger.kernel.org
X-Gm-Message-State: AFuF++l9BRvVv1xW6qPwGQy866xv1qLu8wxsber6pEeZ1IQx2TleyUnQ
	DhURvQZ5uPuwDb8aQBxDSl1u8UgX6MaRfo5GrLi1EiI8KNTZngxOSj895NrGaMZ6OhkqxqO2n+Y
	XJIpUEW7MukGUdYlOY4ZMYg97wbE+0OE=
X-Gm-Gg: AYBFou3OZrSk3jyIHDUtvTmkcKAaXfMwnPOMITTzcWXy8BNc6hrtAex2P6iQtCWyO+k
	JNw24CATHUQESSz2pAjoVklGmH/OLvGx+9HefeCt5yvR0NgKju/4KrAWNio2whv1xfPioT1Avl9
	k4YamZoxZ8PdTurX92c6dYsbWp1spByRjAX+/Fx2OkZ9Scac2zmoVmMOqlK+AjRBLy5NJ68GtmE
	vVGQH7oQ6sCQuNwQ/mc9TBalJv23EqpqfbHG2m3QZf0AeB2QCaPBn/9tkAWE17fAwhmwRiIZPur
	uXIUQcd8C0fc2RLOiuGzZvLpjTiEokg2OOO7RtQ0n+h2Yv04YygJOZjWT3RFUgGKUQ==
X-Received: by 2002:a05:690e:4012:b0:674:139f:2450 with SMTP id
 956f58d0204a3-67683415fd7mr591950d50.29.1790771798163; Wed, 30 Sep 2026
 05:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de> <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
 <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
In-Reply-To: <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 14:36:25 +0200
X-Gm-Features: AclHuK8YPOdQOastRi1a18WPN6tYPPB7dTTORvevLwrAoFcXLuyzCP_Sv7ilYlk
Message-ID: <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:21=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> How does this feedback fit to other known guidance?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
> >
> > I can update more information about the static analyzer (i.e., it is
> > experimental and its reported log) in the patch.
> > I believe this aligns with the known guidance,
>
> Partly.
>
> How many contributors would be involved in the mentioned software researc=
h so far?
>

Currently, I am the only one contributing to the source code of the
analyzer. My co-workers
provide research-oriented discussions but not bug reviews/implementation.
Regarding this, how would it be reflected in the patch?

>
> >                                                but I cannot provide
> > the source code links.
>
> Do you try to follow scientific development methods?
>
> Will publishing requirements grow accordingly?
>

Yes. The source code will be made public once the research work gets publis=
hed.

>
> >>>>> Were any more of your contributions supported by advanced source co=
de analysis tools?
> >>>
> >>> If you meant AI tools, then at this stage, no. For this patch, I have
> >>> used AI tools to help phrase
> >>> the patch better, but I did not use them for code analysis.
> >> Will this information trigger further collateral evolution?
> >
> > The collateral evolution will only affect the experimental analyzer.
> > It does not affect the submitted patch.
> Will opportunities be taken better into account for improved change descr=
iptions?
>

May I kindly ask what opportunities you are referring to? If you meant
that whether
future reports generated potentially with the help of AI tools will
credit AI tools, then
yes.

Sincerely,
Ginger
