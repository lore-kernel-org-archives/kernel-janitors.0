Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G1f6n//v"
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6D31738
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 12:59:30 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso2000234b3a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Dec 2023 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702069170; x=1702673970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//d0ewCiSoi9Ah/KJneNBRTQUj92KNYNsxOQ0uEtAso=;
        b=G1f6n//vyrIqVRqCttdzzTwrVVlx1CyxGpC8ZKZFjfmrg0zF3V1JK2nYGmqsQibT04
         KpIiZOK+hzXbl/GNGG6BqaVgQD+Y/r2eitgyvrRWtEUFhPjh7k7IjJlWyhvDASUvtbwN
         lTr0MFLVck25i0w7WuiiQvWptUkQbaBj9Y+KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069170; x=1702673970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0ewCiSoi9Ah/KJneNBRTQUj92KNYNsxOQ0uEtAso=;
        b=GFSL2i/DvsNpENlEUZcTccRatcmmed/0ZNapSvVW2epVRElPcafI9NYzVsjQ4T3TEm
         zfWEoU5B+pB7Y49SXKpkUM8g4XyTLYdBUJQNqBZ6ovhhJdMTvVncAfQwQj0rTBccKWRc
         LyzEbrRnJAM10IrheJeKT4Jvth+dGq9fTiIExklE+qRFuqnV9YtbVtbFicAISRXB+Kic
         RdK/n+V4q3Ov+vRgXYVybSQRwudhqWmVRQeZZu3zoM6owBhmZAQoq2QyH7BDjTdCyue4
         Sv/jtI/apdr3u8Gm0hDBnjnHSY4XQQH1DSuZKj+PPMCVlHmT2xLbc4w8kTw2ZwscXlWu
         smJA==
X-Gm-Message-State: AOJu0YyqferXXEVx6Ee7dUHdor9wpwzW8mVSGLvE4ZX5Tgc3n/etss4J
	MYiTVSQ3ZcS0lFqL6KcPQuT+zw==
X-Google-Smtp-Source: AGHT+IFxIA2efn2xc4OHP+ACLNti6gZCsvmwQThrbf9iz+l1OK9yJwseOO8PZQqe6Vj8f7ZclAEtIA==
X-Received: by 2002:a05:6a20:1609:b0:18f:b21:9883 with SMTP id l9-20020a056a20160900b0018f0b219883mr801607pzj.32.1702069170403;
        Fri, 08 Dec 2023 12:59:30 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b006ce3bf7acc7sm1997867pfh.113.2023.12.08.12.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:59:29 -0800 (PST)
Date: Fri, 8 Dec 2023 12:59:29 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] VMCI: Remove VMCI_HANDLE_ARRAY_HEADER_SIZE and
 VMCI_HANDLE_ARRAY_MAX_CAPACITY
Message-ID: <202312081259.23AA2CB4@keescook>
References: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
 <c2a231a5ea127b28b5d8c4e86ef471dd01069d47.1702068153.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2a231a5ea127b28b5d8c4e86ef471dd01069d47.1702068153.git.christophe.jaillet@wanadoo.fr>

On Fri, Dec 08, 2023 at 09:46:10PM +0100, Christophe JAILLET wrote:
> Remove VMCI_HANDLE_ARRAY_HEADER_SIZE and VMCI_HANDLE_ARRAY_MAX_CAPACITY
> that are unused.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yes, better to just use proper sizeof(). :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
