Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ePJaVRCY"
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E82A7
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 13:34:57 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c67c1ad5beso5486344a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Dec 2023 13:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702416897; x=1703021697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVaNEiqljo3E3EXGRWD9OJDtRSGtGupo/F0W9RJyA9Y=;
        b=ePJaVRCYQkAmb4oTX3Ee5XFGGvlkk+Lj44VWmjS3GCTcZ9WsuXCwZbgjCJdksJIUo0
         rRtHi4uC1FIQdZCZ73eAJGr1PtytVk5Jz0qsYULnSJKVWXQk7vlLX57PIgGuZOaiAi+y
         rxrBXQ3i9wL2oyairnKxarpJ04rgvvf96kc+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416897; x=1703021697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVaNEiqljo3E3EXGRWD9OJDtRSGtGupo/F0W9RJyA9Y=;
        b=IIs5ZLMXp5ZaUiByQW/XM2jabU3aE8Y5qx+KHQ0C8TQJKfIvdst+K0kJW7+O4/Hp9C
         PhOKZXMPBySHj3cKlRZ530BJruoqbFt7SFEwZDgD4XoL6bCMf0LWSQO7pVwhydRAo7AP
         PJhEnfh+3iLYCABhFIvpg6TybYobNoEnh/MX/vZ9wFSvdZ1fMGLrSv95LzXEpsMsbiJH
         yeKAvnIYU4APZo7TWl/az7B9v4FRrQkwaHVNMO32G+TXeuC9mUvEsWEySRQgJsA4kllc
         UmWwXatmVW+UOdQ9I0f8y9aU3w0DkYW/0hxFKNOb5lpYb2ID4QDUXYVSjlUGyxABrmOl
         5Knw==
X-Gm-Message-State: AOJu0Yzyrtucg+tZ+XV8w7T7RnRRcbebNKzJCto9GQF8ES8Zd+xkSQJ8
	0d7QfJFlELtag6fc3PWiC49Llw==
X-Google-Smtp-Source: AGHT+IGrjdrYE8TdMjASxj4xkbtqabKRt1i/GLLm6pVTSOTn+15PoLIG2QekdDTvI5rmHrrxiENUQg==
X-Received: by 2002:a05:6a20:734f:b0:17b:1f76:86ee with SMTP id v15-20020a056a20734f00b0017b1f7686eemr7870972pzc.16.1702416897330;
        Tue, 12 Dec 2023 13:34:57 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gx4-20020a056a001e0400b006cbb71186f7sm8557572pfb.29.2023.12.12.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:34:56 -0800 (PST)
Date: Tue, 12 Dec 2023 13:34:56 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] VMCI: Remove handle_arr_calc_size()
Message-ID: <202312121334.459D42A1F@keescook>
References: <84e7f2d8e7c4c2eab68f958307d56546978f76e3.1702125347.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e7f2d8e7c4c2eab68f958307d56546978f76e3.1702125347.git.christophe.jaillet@wanadoo.fr>

On Sat, Dec 09, 2023 at 01:36:14PM +0100, Christophe JAILLET wrote:
> Use struct_size() instead of handle_arr_calc_size().
> This is much more conventional.
> 
> While at it, use size_add() when computing the needed size in
> vmci_handle_arr_append_entry(). This prevents from (unlikely) overflow
> when computing the new size to reallocate.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
