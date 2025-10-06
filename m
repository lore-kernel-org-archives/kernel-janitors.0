Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5751B5EC8
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Oct 2025 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759881; cv=none; b=CnTNVG7/pGr9fDGEy9S3Jy6DqrQwF/ENpsxf4MD7Ikg1dozXamcV/sjzfF6ZvyNuh0yK2qYW4CkUQC7KgP31WiSNALJU8rvPzqCcmqZpfeR28tT/RDhQd41EnrAMGjxLKlUZuMKIyE22yThZmPZTkVhEvlx/28WevqyZGoOyx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759881; c=relaxed/simple;
	bh=6KX20FQd1Uo1sLjzECcx7oev8zJiTnNJjFoFDUGykpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=katslK1FmTA8zrlQ2xw2av0B95hO8Js9DbJF8FcVcV23L983HnhXKOgG+S1uZk9cZfmf+2d7ukTunFuj2V4A1HmhJroFLpJdUnbabe8e74gR0ydd1frORHWJf9krobzoR/mma9V/gxZd+G1tKKXxUzjBWN1z+1TiUdmd2B6pGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BU5qEbUC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BU5qEbUC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso4355055f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Oct 2025 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759759878; x=1760364678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4elTS5fxSiSlcbJrOu3/EQIYqhoiCF3SWgVxpKWdawI=;
        b=BU5qEbUC5jt61szkz8QGfDfN+BuXIBOtoGhaedEWqh7+3OwK2w/AsFWpzQW1P8MoUS
         7dqXmZ1zJDFsAI4FwQIm1g0HcQqOmfVpoNoA+GAwFiXqZkcugVoSVW7JWClcI6tZo//t
         uE+QXfPT4ZbNsGvGo6nStGjyG1KyuEZwPF9u/RZfGx6gpXr5MaPGb8bzcJQ+KlQ9kiE5
         4cKBoyiJyFnUxbh4ygdO9KgXXM/OgXlJIZWH7tSsih6EdaXbaQjPVWBVHtLLrZ/bV1Y1
         u3zmR8BW/F9JP2leFfVKAPZy2eMQxQnmzmjswXM7hsi9WrBX20YO1lmqOfk/hl63mMAz
         /Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759878; x=1760364678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4elTS5fxSiSlcbJrOu3/EQIYqhoiCF3SWgVxpKWdawI=;
        b=RQLdbhvxHxQU/CgBCY1aLHqNOM8Dx6cTIWJWBf4SpEcRGSDzTUYqYzfFLQDpg7GGUl
         zypm2lOG833XHoF+ClabOEFaAyig3987+MjRfAdSdH6xNl775Q6MH5q4PNTPiQjrQAAx
         T8QCkN2qnVJyvLLW0IlF8OuVvyrScfeG5qnLyURgbWZDaKJTEiASEginBL0aKZ6QK0dV
         Yee89UsqPh6cj+xWWZSRZn2CajGeMTEMRQ+t1wbvLUALxqA0infDgXMBMczJte663T1U
         oMsIOOO27TbMnfcwVn0jGbrAwpCcAPrTd5p7iTcqHT+FdZBs3RwPSxGDtUDtPLFUhnOF
         TZaw==
X-Forwarded-Encrypted: i=1; AJvYcCWRjlGCdaVaO7ddjXUXR2OueXmrt+ce9HD0uFQBSoLMHHIfUTdW6YYJGLYXm+2z4HNxHUUGe9QWFIbrKtpRhPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRrdd4wjAAlQUIIth8SiniKe5kdRLgrPo5xqdfPCH5UWie1mk
	l0ikxRjSRWVIruyyymfP+fx/xgrqnYB363PGjgI9Dw3Ks6/TOGKkP3V4c6mcfJf23EI=
X-Gm-Gg: ASbGncuro/RWKhN/c6KDolIkG8WnRN4gEXSng8TFvN++dLFORQTsX9XKBkNonztQU4u
	0SmiDTL42CJ5V6DZcKopkx2MJbbRiLqDC7qQ0joy8WEs5fRekQtyU2lZHqQhlDmNqWB3eGU4gEg
	o6XBm1/SXEDDCMvvEzbHIxu5jHcF81OgR79OULYbccEd24Io3gEh44pg0rfdGFoQrS51L0FSZJZ
	5opgl/8uemT6mDBDZ4hqW9HUYqGi5XEJ10kKkt7KiyMB9hWaACU+VvS6/V+V+ey44vJCht8z6IE
	8DoLG0KX8SpnlASvpUN5+ia0a3SRHU2SulvC2BU8Kk/n8Xy7RIsysmNlyjk33CrzS2jYKU2NJFX
	ePksJiF8zYls+j8VHY9LTxgH88VPl8U8GhK91KQkNjU+HHq2+7wTue1SqhcGDRcTm2JdZ53ohSa
	+VYNiKle7UDlxQe5rqTZBCrgOBd7OUFqHF0GfS3Q==
X-Google-Smtp-Source: AGHT+IEM2L1wWYPT5u1TbIMvltisCAwxrpRriHBP3NHzwPBECHbb42VTLW67CPPTPF2hjKNFBgKsJQ==
X-Received: by 2002:a05:6000:310c:b0:425:7f10:e79b with SMTP id ffacd0b85a97d-4257f10eaa1mr1731307f8f.44.1759759877557;
        Mon, 06 Oct 2025 07:11:17 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bc01:231a:db87:72a2:aec1:dfe2? ([2804:7f0:bc01:231a:db87:72a2:aec1:dfe2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e121e0afsm9126319a12.25.2025.10.06.07.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:11:17 -0700 (PDT)
Message-ID: <8e79516d-ad82-46bd-af00-3a8594a0baee@suse.com>
Date: Mon, 6 Oct 2025 11:09:06 -0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: client: Reduce the scopes for a few variables in two
 functions
To: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Steve French
 <stfrench@microsoft.com>, Tom Talpey <tom@talpey.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <468cf96a-5dd9-4aa5-a8ce-930cf16952b3@web.de>
Content-Language: en-US
From: Henrique Carvalho <henrique.carvalho@suse.com>
In-Reply-To: <468cf96a-5dd9-4aa5-a8ce-930cf16952b3@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Acked-by: Henrique Carvalho <henrique.carvalho@suse.com>

On 10/5/25 2:10 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Oct 2025 19:01:48 +0200
> 
> * cifs_lookup():
>   Move the definition for the local variable “cfid” into an else branch
>   so that the corresponding setting will only be performed if a NULL inode
>   was detected during lookup by this function.
> 
> * cifs_d_revalidate():
>   Move the definition for the local variables “inode” and “rc” into
>   an if branch so that the corresponding setting will only be performed
>   after a d_really_is_positive() call.
> 
>   Move the definition for the local variable “cfid” into an else branch
>   so that the corresponding setting will only be performed if further data
>   processing will be needed for an open_cached_dir_by_dentry() call.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/dir.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/smb/client/dir.c b/fs/smb/client/dir.c
> index fc67a6441c96..7472fddadd4f 100644
> --- a/fs/smb/client/dir.c
> +++ b/fs/smb/client/dir.c
> @@ -678,7 +678,6 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
>  	const char *full_path;
>  	void *page;
>  	int retry_count = 0;
> -	struct cached_fid *cfid = NULL;
>  
>  	xid = get_xid();
>  
> @@ -717,6 +716,8 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
>  	if (d_really_is_positive(direntry)) {
>  		cifs_dbg(FYI, "non-NULL inode in lookup\n");
>  	} else {
> +		struct cached_fid *cfid = NULL;
> +
>  		cifs_dbg(FYI, "NULL inode in lookup\n");
>  
>  		/*
> @@ -785,15 +786,13 @@ static int
>  cifs_d_revalidate(struct inode *dir, const struct qstr *name,
>  		  struct dentry *direntry, unsigned int flags)
>  {
> -	struct inode *inode = NULL;
> -	struct cached_fid *cfid;
> -	int rc;
> -
>  	if (flags & LOOKUP_RCU)
>  		return -ECHILD;
>  
>  	if (d_really_is_positive(direntry)) {
> -		inode = d_inode(direntry);
> +		int rc;
> +		struct inode *inode = d_inode(direntry);
> +
>  		if ((flags & LOOKUP_REVAL) && !CIFS_CACHE_READ(CIFS_I(inode)))
>  			CIFS_I(inode)->time = 0; /* force reval */
>  
> @@ -836,6 +835,7 @@ cifs_d_revalidate(struct inode *dir, const struct qstr *name,
>  	} else {
>  		struct cifs_sb_info *cifs_sb = CIFS_SB(dir->i_sb);
>  		struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
> +		struct cached_fid *cfid;
>  
>  		if (!open_cached_dir_by_dentry(tcon, direntry->d_parent, &cfid)) {
>  			/*

-- 
Henrique
SUSE Labs
