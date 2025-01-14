Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741417557
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849905; cv=none; b=g8tANXEPslpBy2CDVFRkdcSXgbiElVOYusAMUI73pThReFUJZ3I0tYsYCPzuG6M7nOPSdxRJTXeOEtomhogTOYi9ifUNeofsSPutreyVR4qvYXnJnRNGcGOhdExRKjpDN9DGbFdEALI89e/cgaHIIYVFm5MT8ZqYrU2MMqQ9rHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849905; c=relaxed/simple;
	bh=Phk8b9T+9WHb4sdBu4TnvawdtCyfivT+01BinaHctZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwrZMEeZPKaNxnFVACVDxnTy/f+XS5+glUABLh9S8l9+ClF9WOmwSulA/55+eO8D+HmYTTpSj+l4JrT0CvB9V4nXPPLgr0yViGQp68dHa+cYPKJyO44c+3wiYM+6FWed0LbSLcJD7++zs0omJG2zHqnTxy01CFwDfN17YV+J2Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xurKFT/I; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xurKFT/I"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab322ecd75dso127614366b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 02:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849901; x=1737454701; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HiN+MGob9C/wk/ZA5GyHyYf/yvpWUeM+njdEkAZ9s5M=;
        b=xurKFT/IORv/Svwo/aRFaFpJxYIS0HAy715idWlpOTpFkXLA3LcZnaLZrP2yHkL34d
         lPGZdyagE/svPtk0ohFx7/Ts0LKDURKWPhgf9D8xqICaQLZspizYOoUSjvVHkP+fMt9m
         okntnJDC/KxxKUrzypOgedKoU85c+LsV+v/DDBow0M0wjC6HKiHdGdWlCqWXDiZ/G42Z
         2MUnFVSWllXAiM9tLtqrRBlOuT+LKDU6XXMs5P7DdE/jkTETsld8fcrtPBSgdNlsQnVP
         XMbhD7BYzxRizW/LNuhdZk0WPRigmgTrAOxd/AvEx5EX8tc7UQ8ETHPJ4HTx9Eqc0IU/
         w4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849901; x=1737454701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiN+MGob9C/wk/ZA5GyHyYf/yvpWUeM+njdEkAZ9s5M=;
        b=qx8tzSR0tkBonjmwRDZfebK6lg90/atvtMqyBqSKrMa1TURttz55NhtvASr53izw67
         3wkWew5+u2srmbhB+1IuDqhHtCSh3zGAbcPz2iQ5S2yQv0GqZx9UFtGriyGLkYQvaik9
         7R8NTYPaSqAu3uTGvcFCOIyLxSyeGRlAf6e1JM8oNQUhwJ9+/V5aeVwfcQdUGvChe/VL
         tdsjCfuZCZXag5S1je7xTWur3O5L0s+jhZACD8ssMjLYRyj54SSsh2ldGKvzwIDQpxy7
         Tg9gFksP/ZmTjahZskZxxLrCeThVOE/2ug7CWFbMPgBODn3IflERqDfgm21bxGRWHX7H
         djhg==
X-Forwarded-Encrypted: i=1; AJvYcCWiSdoyVVx7wCbTBRSKzbPq5VADTTyzduOrO+pgCSWlRNo6+u0r0PcSaat782QqsKNln+iihZIBbJqsWfa1nck=@vger.kernel.org
X-Gm-Message-State: AOJu0YysWe7P5NUvg2WgDNAcZtScIV7GljtKSRcZN7LV1BHawCmCURbE
	eg2waMZMku9Sy3fwzq9eVJArKvN1Kkr0Mh2HJvgbZf6D+CCZiAtDwnQBB79wJ4mSKbNgi536AiZ
	p
X-Gm-Gg: ASbGncv7540Erp2UeAm9XG5Cx8G0qxB3gWdKW+O03z+PLvEHrZqekZPbI5yeFAVaKCh
	hLadBJZ8oBUAB+peHw9p8rl3is4enhZGkVHAH7RcBdYMnXvRL6IfL6pzArWkxSoAj5UpoMS8Rcl
	Npjqt0NWAgvSZsjZfSX9ZmZ/HAZfwgrorIpL4wIgXtCMXqdjSXXewGAgUxpWnPg2QkP/l3J7JvA
	1OzCfJNuMU6Hy+KNUZPfDvaBISxTOudvwDxLm1GjPv7MVlyyFst1Woh8yJwtQ==
X-Google-Smtp-Source: AGHT+IG7WJ9asuOTLZHhddJPlsSkJ0crkaJ1q1rMz0GpfqaRWdDxghBy3ePeVf/MPb7/xuRHzAReRg==
X-Received: by 2002:a17:907:2d86:b0:ab3:42b2:2886 with SMTP id a640c23a62f3a-ab342b228f4mr34692266b.3.1736849901536;
        Tue, 14 Jan 2025 02:18:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905cd8asm609773166b.7.2025.01.14.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:18:21 -0800 (PST)
Date: Tue, 14 Jan 2025 13:18:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <sfrench@samba.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH RESEND] ksmbd: fix integer overflows on 32 bit systems
Message-ID: <2fb3efb4-a889-4b49-8100-51147d9ae426@stanley.mountain>
References: <b00cd043-7e52-4462-8bb7-b067095bd5fd@stanley.mountain>
 <CAKYAXd95gAZ4h1TJtFg2bKakSLQcR2294+mZ1tJY5zb2V-rhaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKYAXd95gAZ4h1TJtFg2bKakSLQcR2294+mZ1tJY5zb2V-rhaA@mail.gmail.com>

On Tue, Jan 14, 2025 at 04:53:18PM +0900, Namjae Jeon wrote:
> On Mon, Jan 13, 2025 at 3:17 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On 32bit systems the addition operations in ipc_msg_alloc() can
> > potentially overflow leading to memory corruption.  Fix this using
> > size_add() which will ensure that the invalid allocations do not succeed.
> You previously said that memcpy overrun does not occur due to memory
> allocation failure with SIZE_MAX.
>
> Would it be better to handle integer overflows as an error before
> memory allocation?

I mean we could do something like the below patch but I'd prefer to fix
it this way.

> And static checkers don't detect memcpy overrun by considering memory
> allocation failure?

How the struct_size()/array_size() kernel hardenning works is that if
you pass in a too large value instead of wrapping to a small value, the
math results in SIZE_MAX so the allocation will fail.  We already handle
allocation failures correctly so it's fine.

The problem in this code is that on 32 bit systems if you chose a "sz"
value which is (unsigned int)-4 then the kvzalloc() allocation will
succeed but the buffer will be 4 bytes smaller than intended and the
"msg->sz = sz;" assignment will corrupt memory.

Anyway, here is how the patch could look like with bounds checking instead
of size_add().  We could fancy it up a bit, but I don't like fancy math.

regards,
dan carpenter

diff --git a/fs/smb/server/transport_ipc.c b/fs/smb/server/transport_ipc.c
index befaf42b84cc..e1e3bfff163c 100644
--- a/fs/smb/server/transport_ipc.c
+++ b/fs/smb/server/transport_ipc.c
@@ -626,6 +626,9 @@ ksmbd_ipc_spnego_authen_request(const char *spnego_blob, int blob_len)
 	struct ksmbd_spnego_authen_request *req;
 	struct ksmbd_spnego_authen_response *resp;
 
+	if (blob_len > INT_MAX)
+		return NULL;
+
 	msg = ipc_msg_alloc(sizeof(struct ksmbd_spnego_authen_request) +
 			blob_len + 1);
 	if (!msg)
@@ -805,6 +808,9 @@ struct ksmbd_rpc_command *ksmbd_rpc_write(struct ksmbd_session *sess, int handle
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
+	if (payload_sz > INT_MAX)
+		return NULL;
+
 	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
 	if (!msg)
 		return NULL;
@@ -853,6 +859,9 @@ struct ksmbd_rpc_command *ksmbd_rpc_ioctl(struct ksmbd_session *sess, int handle
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
+	if (payload_sz > INT_MAX)
+		return NULL;
+
 	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
 	if (!msg)
 		return NULL;
@@ -878,6 +887,9 @@ struct ksmbd_rpc_command *ksmbd_rpc_rap(struct ksmbd_session *sess, void *payloa
 	struct ksmbd_rpc_command *req;
 	struct ksmbd_rpc_command *resp;
 
+	if (payload_sz > INT_MAX)
+		return NULL;
+
 	msg = ipc_msg_alloc(sizeof(struct ksmbd_rpc_command) + payload_sz + 1);
 	if (!msg)
 		return NULL;
