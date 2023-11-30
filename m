Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KVIcu+K7"
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38D1172B
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 14:00:14 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c19a328797so1117659a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Nov 2023 14:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701381614; x=1701986414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3oJFeliwcGWQRUno3CXq/iefN/z87FyQUWuXF3JGq8=;
        b=KVIcu+K7OlsXPkwye8g/BYKLJlKr8R+30mNOdPdoXYIea5Z1sRJykikZYdQfMYjaOf
         u/iJGPPuQPCz1hMizQzgoxlG2mZuqK8MGYj2laJMa3aIOxqqeU05Fiwjl4zM0/ZkQmQi
         hcEGgFdi224y5/1uzm9Vk3cMSiywhUOJh5UX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381614; x=1701986414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3oJFeliwcGWQRUno3CXq/iefN/z87FyQUWuXF3JGq8=;
        b=HWeNXlKCpSYihTRss/qHrj7TOutFAX2kChv1BHehnZDNFnlcsKku6EIhKJkIheFMYg
         bP5TfQs2MWvb1KKSIy1b97ZCVCg20kb0y6Lxs6Z+xWynuj7CKz9RK5Cu/z58aXZc2PvF
         M6H1DKyYQmvt1fn3DOeOufbw80hfUAGigf3FET+Vn5mfUkdHymz3qaSR/7UNF5A+PMSm
         1QI168YrYEVeWqFLNKkXOGdofTUNvtzbb7nV0/WTQvHeWgRgs3V98iTLAsdzD++WiL3o
         fMqutWXBwVroy0IYdQPskILmqZIKwtvxXiYjwAg6qjQ6AIqPfnxzu+m45cWjb7nbJmGR
         /kYQ==
X-Gm-Message-State: AOJu0YyJiJcNDQ4embSG69ph+W9hiuloMwspLErwcUmbw3R8RlDi831E
	BuTu1SoPhQoYUThxRmuDcI8wLg==
X-Google-Smtp-Source: AGHT+IHXj/e2zptmeZA5+AQNZP+QCtXebes1TXUPHkf0woeufQzAqe9Ylzhwe1YtCnXulknD2ks53A==
X-Received: by 2002:a05:6a20:e123:b0:18b:fde7:71ac with SMTP id kr35-20020a056a20e12300b0018bfde771acmr23958783pzb.60.1701381614459;
        Thu, 30 Nov 2023 14:00:14 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78691000000b00690ca4356f1sm1699814pfo.198.2023.11.30.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:00:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Bryan Tan <bryantan@vmware.com>,
	Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] VMCI: Annotate struct vmci_handle_arr with __counted_by
Date: Thu, 30 Nov 2023 14:00:09 -0800
Message-Id: <170138160625.3648908.9493256732138039199.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
References: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 07 Oct 2023 16:32:34 +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] VMCI: Annotate struct vmci_handle_arr with __counted_by
      https://git.kernel.org/kees/c/81c643edd8bd

Take care,

-- 
Kees Cook

