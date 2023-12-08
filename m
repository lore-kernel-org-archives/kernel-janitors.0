Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KRy2uwbr"
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4628BA
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 13:27:23 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ce94f62806so1727648b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Dec 2023 13:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702070843; x=1702675643; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mix9yN+rFBE8tcJIqsswkQecCZSelxz7obmiD13PDJk=;
        b=KRy2uwbrNXlqBRQM5J/YBUe2XoQrUyL8l9YmgAblbpjpIfu3vDgEig9kyTNg/RHXod
         uorJ/zi7BzFyXkiVitaQ7qHe0Va61sWIVTTk/tym+J1oit63gf8zbu2vOi+o05Q8VLUM
         7UrXPpLhaowrNL97g9Ob4gZW2okor7vl9WFUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702070843; x=1702675643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mix9yN+rFBE8tcJIqsswkQecCZSelxz7obmiD13PDJk=;
        b=TcoEW1q2yS362XhKC2gGOBBbXnSSN27tYiUh5laZ3CQVSdNNuALV5EcBdeTcKnQPK+
         MHFPqypUPYPoj/hmcT+L9Wm1VjntluHH8mGeY6a+ZWmyLkBe3M5dQ7zkhwApBdmKVqA6
         9zqxpxvftvnHf5RW923BUG3e7ggi4plQ/YF8KleTs+Mq3GPgnXbgTbLefBFtTM7NJnRd
         0YUMLO5bITThpwQM1RCh/7rDAoJcZSfNTZ3MkBh5OMaXF3XrhCIfbV8GYNJNKjvHf1FH
         ojwbEdssouDkZ1GMc/G9/iQ7MegL9Dwbjez6WGwInAgMCTviAkKcz0ED3rJ7zsWpc8yC
         HHIg==
X-Gm-Message-State: AOJu0Yy2pYJEK/sPNZhl2CQPHxU8DDEPCFdvl8NuYAWSQrEPUUSugBQ5
	23DWVKsAkR3VsBFiZ9Hugb4Fb/WjK+SpsPhH0yw=
X-Google-Smtp-Source: AGHT+IFW9I9beJ59YFn0ICvmnTLt/nIR+xlNNNgyYig3pnrACbKn9r1AyU2p7cUe8mYp5UTVBMTrdQ==
X-Received: by 2002:a05:6a00:179e:b0:6ce:2731:c243 with SMTP id s30-20020a056a00179e00b006ce2731c243mr874129pfg.50.1702070843341;
        Fri, 08 Dec 2023 13:27:23 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u18-20020a056a00159200b006bf83e892e9sm2035637pfk.155.2023.12.08.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:27:22 -0800 (PST)
Date: Fri, 8 Dec 2023 13:27:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] VMCI: Remove handle_arr_calc_size()
Message-ID: <202312081325.1202F2042@keescook>
References: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
 <202312081258.85F7D88E@keescook>
 <7fee5580-37ad-4c0a-b1d2-f45b592f86a4@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fee5580-37ad-4c0a-b1d2-f45b592f86a4@wanadoo.fr>

On Fri, Dec 08, 2023 at 10:14:35PM +0100, Christophe JAILLET wrote:
> Le 08/12/2023 à 21:59, Kees Cook a écrit :
> > On Fri, Dec 08, 2023 at 09:46:09PM +0100, Christophe JAILLET wrote:
> > > Use struct_size() instead of handle_arr_calc_size().
> > > This is much more conventionnal.
> > > 
> > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > Looks good. And since capacity in u32, there's no need for size_add().
> 
> Hmm,
> 
> isn't u32 + u32 --> u32, so can overflow?
> If I understand correctly, the type promotion to size_t will occur after the
> addition.

Oh lovely, I thought the promotion was first. Ugh.

> So size_add() looks needed, or I missed something?

Yeah, and I'm also to stuck in pretending 32-bit systems don't exist.
So, yes, please include size_add()...

-Kees

> 
> CJ
> 
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> 

-- 
Kees Cook
