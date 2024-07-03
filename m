Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601B13A25B
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Jul 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012999; cv=none; b=ZV5Mf7r0VQx4SqKV5Qd3N9zv9zajFYyhowFiFdJerseZUycgvIFeUf1a5uJJE6qSY/eyw8DJTIEedWbgSxgx1IP29EgxzVqMIqfW29GY5UcAqQFfnHTrp4xJ82Nf87qJ6mNQGanm6RSDTJO/D9JjSXcCfJDfn9u8gjwsyflDEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012999; c=relaxed/simple;
	bh=XkZ36YVkSCYdsa2PZ9dd8KTKzlgKsyNmSOvBW6fXlRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGvI4yRSyzhDi3Jfi8lE3rWjNlGcgxzmDCgPlBCW5XJ/aTKiFSBUBtF84ZyJ+F4OKJyqc/vxRod3opfvM6CRoXP+NLtzjq1cvupGD8dIHQ6La0b3GdnVib23FODuBWyRhx0Q2rRiH3QQ+e5k3Hi1deOnKd+JXa/WXeYiVtiFyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyvWpIyC; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyvWpIyC"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c47cc12ddfso89915eaf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Jul 2024 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720012997; x=1720617797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5g2d7cGxt5LUhs3Ln8D9odUoDF0lLXQxROOlmlLiFA=;
        b=jyvWpIyCy7LZmxcm0VigiCYObo4vP6KKgFIJP14jAx1STjvEpVVu4EFbjizRTrZhiq
         36s9BNUCMBkaJYKiUDa/hh7nTOxl5ncSqMctElJBGjoCf78Gii6n2utEBESmrAy9uyYa
         uWHVDJ/XlpZImKDq6cn1lJeEooCvpC4pQcj8K6YbwK72/vAdeHaJWd5LGYaSXavaeipd
         hroDJvYzU15B+K84zHRMvzQ0iVUJb7PohuX/q66qI1gJ6O0aAbdnAcKQDeoH50mC7Cce
         NGdgXeEvKsPgDQwLeHUIXOY3zpNhKeR1k4/BGbkwYJYOKHMlE6DNILdRJVNUXXxz7nh+
         P8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720012997; x=1720617797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5g2d7cGxt5LUhs3Ln8D9odUoDF0lLXQxROOlmlLiFA=;
        b=eSKW8kAqU5Fa2KvbisQpLfqKzqYPqVxtqL0K0uPF/HCoizRcIubW4gdx8QV7MFsBNu
         VIBpU/muLtoJv3M9GNBNBHRYRTpm/jlLSHHUepLxnISH9B+Hg11u/hXo9U71eBPr1aTw
         gWIjl9OCH73zUSyE9XRCWimicTNsnOuDqbBWZ+0Db7KYATbQ8/xxGavYkGkl6cwK/m59
         iCoDwSYzB1JVCYjVp8weHqkApDPMsbzdrkuTGPzy0dcV/I1xfsgKtYyimPTdZRYSe+rb
         qtETM9qgFBS+jNWz37L1hdUvcNsu/qh+j+w3Z7ZNs5M++MwA2ytaVVAvpxjeXPJaBDds
         x7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXsWWW5Grw5NjKt6lnWZtOH3KutR3Gc13U2/mvVRjIZDFdTVXhMNDaCRJt9kzioHpAni8RW/YHb0FYuSmhqjk3k20ZrilqOQiP2+wBS8sXI
X-Gm-Message-State: AOJu0Yz8W6v7uX6DwN9LhUhBRanh14ShG4D7YCed++wM6lTnDmT48dnJ
	KGwHTjFOW4H4H7UdjV1dtKGJhjOGgn3KARd2TFxW44g0jF6JnE1N1o5Vh8s4GqU=
X-Google-Smtp-Source: AGHT+IGplWSy9vOCLJA/qnz+gTqhZnkdj7xlESE8azCcFRv+VtomZcElQ/dKFnO84Qfq84NOw3z4Hw==
X-Received: by 2002:a4a:4884:0:b0:5c4:fc6:c7f5 with SMTP id 006d021491bc7-5c4390512d7mr11084414eaf.5.1720012996656;
        Wed, 03 Jul 2024 06:23:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c46ae49decsm327881eaf.24.2024.07.03.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:23:16 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:23:14 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Su Hui <suhui@nfschina.com>, Kalle Valo <kvalo@kernel.org>,
	johannes.berg@intel.com, kees@kernel.org, a@bayrepo.ru,
	marcan@marcan.st, quic_alokad@quicinc.com, zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com, duoming@zju.edu.cn,
	colin.i.king@gmail.com, frankyl@broadcom.com, meuleman@broadcom.com,
	phaber@broadcom.com, linville@tuxdriver.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless 1/9] wifi: cfg80211: avoid garbage value of
 'io_type' in brcmf_cfg80211_attach()
Message-ID: <3f7bcda7-092f-4d94-80c7-2015e860fbe2@suswa.mountain>
References: <36cef2a8-10a3-928a-d962-3599333d9ac8@nfschina.com>
 <19076e6bec0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19076e6bec0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>

On Wed, Jul 03, 2024 at 06:42:32AM +0200, Arend Van Spriel wrote:
> On July 3, 2024 3:42:18 AM Su Hui <suhui@nfschina.com> wrote:
> 
> > On 2024/7/2 23:39, Arend Van Spriel wrote:
> > > On July 2, 2024 5:29:27 PM Kalle Valo <kvalo@kernel.org> wrote:
> > > 
> > > > Arend Van Spriel <arend.vanspriel@broadcom.com> writes:
> > > > 
> > > > > On July 2, 2024 3:57:27 PM Dan Carpenter <dan.carpenter@linaro.org>
> > > > > wrote:
> > > > > 
> > > > > > On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
> > > > > > > brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
> > > > > > > brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage
> > > > > > > value.
> > > > > > 
> > > > > > Since you're going to be resending anyway, please delete the space
> > > > > > char
> > > > > > from the start of the line.
> > > > > > 
> > > > > > It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
> > > > > > It looks like it just goes to great lengths to preserve the original
> > > > > > data in io_type...  So it likely is harmless enough but still a
> > > > > > strange
> > > > > > and complicated way write a no-op.
> > > > > 
> > > > > Not sure if it helps, but I tried to explain the reason in response to
> > > > > patch 0 (cover letter).
> > > > 
> > > > Would it make more sense to have just one patch? It's the same issue
> > > > anyway.
> > > 
> > > Yes, but I would solve it in brcmf_fil_* functions (fwil.[ch]).
> > It seems you will send a new patch to solve this issue.
> > And I guess there is no need for me to resend a v2 patchset or just one
> > patch.
> 
> I am not entirely sure. If both gcc and clang would warn about using
> uninitialized data I would be fine with these patches rolled into one.

We should definitely fix this, it's just a matter of how.  UBSan will
also detect these at run time.  And honestly, it's not clear to me where
these eventually do get copied to?  Is it to the firmware?  In that case
it might be that we'd treat these as a CVE.

regards,
dan carpenter
