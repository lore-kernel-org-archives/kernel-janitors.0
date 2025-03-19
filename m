Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117A1D54FA
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401580; cv=none; b=EEW56vSypTCc9PQJ4CaeWvK9t1NVvfF0m+Lj86Iel6/ixxC4cI1bhyMlF1BLSDvbWtZwFmeXJrbBspnPTvpq/4P7MYrnWo2uXLFZa/iQzelIxwmCJP/+fyeNideJ2HUCGSArQcm8bPkdl1wClEvJs0E9Gb1Xg4nSHPd3JLZbteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401580; c=relaxed/simple;
	bh=OCRQp5fr35CFrlhuhI4lN2VNPjl3NAmAnOq3UyC7mHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSihoZ27QUhIELIOwR6nIEKEItrFot3jmJmTAVBXcuxr1eBHCqkDTqhBvmCtvX1vJ7u/hOw2yZGPNjJ/S4id04jeciSokNf41EPY0DWVwzRdA81SOulc++mIBJLsxFBGBYHfKC5w9VVWc2JKKZ7FzQQK+TMDsKylnwxTIS4LPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIaJ3u5m; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIaJ3u5m"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5735158f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742401574; x=1743006374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JH33TulQ7AeLBSliw6W1zrkQlKT21gkjpSn+Pjq8u+M=;
        b=SIaJ3u5mbLCMwdSPc3ktMvzsO6SEWHYlG4D6zBwFR7XRm5jd49XdKkGLizJ47IWeq+
         OjOJ8Vi32Ex/CRCIQCF+JBkuyS9qzxr3ka34w2AhkCvFUme2yRGNXau+h9CTMtaticzv
         rSkv1kGoT/SmXT/5GMSpfWdAEwKdotV8mDwLMwqjZ6/afN04VmxEECHYKM/9h0HoGukm
         KG5oqCYfemKF/HSfdaZ1j6yoLwmCiNI13t62iDRHH9QFZNeyt85+WbZ+9L06Kj7NfxBG
         rVzn1dQYP+AlZ+ocofeE6lt5VIlaytd5faOO5Zjof9LnHBI/9zLtrkojioGdqGMgfoOo
         5Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401574; x=1743006374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH33TulQ7AeLBSliw6W1zrkQlKT21gkjpSn+Pjq8u+M=;
        b=XMkcvsJN2wrdRBXaTJqD9wLQO54mvPuFeVvY8qhMgawdfQZZy6hQ+s+xy8awgpEWkB
         gl7okYDsR7/mUY7QjHTKgjJTRc+2P65Hlw7IS31mQnr5lNGByeuci3WTmZLws/SrKSpf
         Lu0IpSYzgX82KVvQtyM49QNHlADXk07TJcMP5goVteh41W1eIqn33KELeSy4zPEIjIZm
         IAIGWQr61Pv/pWJdqK/ijCHLPkr1FG22yGq5ifbSStIgO3zuPqaxVIll2rEaxJDYsliX
         BjBM0dWaFDGEwtGIoEO2a+nGuU+TDKbzilDrRBCQGVnPbKjzdvmtok36vsuvLoHH4djy
         qDWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSyBVpJKdrx3ezpuM7zVQ8RRasjAvbaZr/sXASgfUD3ZNfPTSEhf+LXChCy4ZQ7nG6VcdoVymCpQoxzcBZeW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5WofSyeSmXyKj6TQVMPQ+r6nGC/KGoQl1bzrOPOsyL61xkh+
	Zy+WJ5fOT3WHjczvl67x1/8HKpZFA/J++NTbt2Qds4zECbW+UO4MFOdUUL1gh78=
X-Gm-Gg: ASbGnctOD0kC4EmFn6Y/oAWCONG4LIGQMicnL2ROpNY5Xf5iR9kalwdiF7YVa/vwLqy
	YuCT/2ifSZ4Y9uZQs66yBTVpP0bnkGBkfnRHMVzCXsIYP93+vVs3DvzSl7jEpPmjLJVTrXe1WCO
	F2EWDafPpiOLIPc/COWj+iyncC9YgxAgbfUvEX9dXaJldBRaD25k+v/ZVahhlPr355lfSg1hFK1
	LocHsSjnEi8TLdQu9MfRM6ePGNIQcH3a4zsqYkCPLaiNXDRi463ZAM5/eTYgAyeEseQqxTpF0Y4
	caazfJ0OqbhCXUXVlrIjJPQkNeMh2wRk6oJ+HNaSnkGuNld3hw==
X-Google-Smtp-Source: AGHT+IGP+Hvtg5qVl/vhr+M/j+W1mAMAMQUY9wQh9XWtXxPXI2OEgW0J0m0Nwh+n2rhGuKNS2CTXAw==
X-Received: by 2002:a5d:59ae:0:b0:398:9e96:e798 with SMTP id ffacd0b85a97d-399795a8cb5mr149770f8f.13.1742401574434;
        Wed, 19 Mar 2025 09:26:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f32fcdsm23697435e9.7.2025.03.19.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:26:14 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:26:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Nelson, Shannon" <shannon.nelson@amd.com>
Cc: Brett Creeley <brett.creeley@amd.com>,
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] pds_fwctl: Fix a NULL vs IS_ERR() check in
 pdsfc_validate_rpc()
Message-ID: <f391dc76-946f-45c2-af81-a5cb107ec783@stanley.mountain>
References: <925355aa-c98b-4fa7-8e49-b97f6d551a86@stanley.mountain>
 <b9f49f34-1a69-41bc-8324-2e969e53f9eb@amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9f49f34-1a69-41bc-8324-2e969e53f9eb@amd.com>

On Wed, Mar 19, 2025 at 09:18:31AM -0700, Nelson, Shannon wrote:
> On 3/19/2025 12:06 AM, Dan Carpenter wrote:
> > 
> > The pdsfc_get_operations() function returns error pointers, it doesn't
> > return NULL.  However, the "ep_info->operations" pointer should be set
> > to either a valid pointer or NULL because the rest of the driver checks
> > for that.
> > 
> > Fixes: 804294d75ac5 ("pds_fwctl: add rpc and query support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Hi Dan, thanks for this patch.  We also have this same fix in the patchset
> update that I was expecting to push out today, but you beat me to it.
> 
> Shall I continue with our v4 patchset, or should I now be sending smaller
> patches to update from earlier review comments?
> 

I don't track how these things are merged.  If you were going to fix
it in a v4 patchset then just ignore this patch.  Typically in that
case you would fold the fix into the patchset anyway.

regards,
dan carpenter

