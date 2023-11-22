Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cZ5f3xNW"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D321D98
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 13:09:01 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5488bf9e193so279980a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700687340; x=1701292140; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjZ3A9RnpMc/0GPOf8DzrpfaMDka4vJ8RxujHh4ePRw=;
        b=cZ5f3xNWf09bMUeyO4tFETck7YRt9o+Qly7cW6Ou2f3YgPQrbYAd5kc0URFkAFaVyh
         TDVJuH8mMTZUAyIGQOY/eIIP8VUR7/m4PX/MCr6rN+mLTWA2FtqgdTDeoKdcVMY78SFV
         5wxoYV9cnFy1J13irgingKBf9OhowUB+Ugq7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700687340; x=1701292140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjZ3A9RnpMc/0GPOf8DzrpfaMDka4vJ8RxujHh4ePRw=;
        b=SXlhjJOduTa4KUNiGdQR+APYju/pjBpJLAAGykQOKGMXOTLpJrIkZDriocg6A+iapW
         via4711xjIcRHpGn93SC2T1Rf5YjYID1DSRaAjNy4scTR+Vg4i1BbqwUjStnnmMkls01
         gcouPyXiwESBWrbwW0tzd58MwzRaQUmu8KasFLIxHdroG1BzLHGTnhRGBuSPuY4Fc2Jj
         Y9lZwL/KMwOb9DolEl/pFQttMuXu0wpgufRME+h0sWdHjKzAdJuV6rFUSXw0Lep75qV1
         8TVkuNcUnx5a3moO0khMGI/wHY4TpdyKxDkuG7FoFZEzNUqihfR9ZELxjeZFP9DMH+sW
         aGsA==
X-Gm-Message-State: AOJu0Yxucpk/GAY2CcgtafBMD4RAz3parF2VZtO5DTiYqVjAkIPf0jtt
	0i5oio7r57VO4JStK+TJV4bj1+VIKVngrQQOQx15Pc+H
X-Google-Smtp-Source: AGHT+IH390yuxDRu1GQmOwO9EwoQdGZClADFmKRTGoS3RCGfvTwK+Oo7GyLTuX1phXAj2VuxuG133A==
X-Received: by 2002:a17:907:d38a:b0:9b2:b786:5e9c with SMTP id vh10-20020a170907d38a00b009b2b7865e9cmr3213603ejc.28.1700687340095;
        Wed, 22 Nov 2023 13:09:00 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709060a8700b009c3828fec06sm217024ejf.81.2023.11.22.13.08.59
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 13:08:59 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso279802a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 13:08:59 -0800 (PST)
X-Received: by 2002:aa7:d050:0:b0:53e:1825:be81 with SMTP id
 n16-20020aa7d050000000b0053e1825be81mr2626539edo.21.1700687338666; Wed, 22
 Nov 2023 13:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info> <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info> <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
 <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info> <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
 <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com> <20231122205135.GGZV5p157mBi6RYUNs@fat_crate.local>
In-Reply-To: <20231122205135.GGZV5p157mBi6RYUNs@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Nov 2023 13:08:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>
Message-ID: <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to CONFIG_MICROCODE_AMD)
To: Borislav Petkov <bp@alien8.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, lukas.bulwahn@gmail.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:51, Borislav Petkov <bp@alien8.de> wrote:
>
> My only worry here is that we're making a precedent and basically saying
> that it is ok for tools to grep .config to figure out what is supported
> by the kernel. And then other tools might follow.

Yes, I agree that it's not optimal, but I would hate to have some odd
"let's add another ELF note" churn too, for (presumably) increasingly
obscure reasons.

It looks like dracut has been doing this forever, and in fact back in
2015 apparently had the exact same issue (that never made it to kernel
developers, or at least not to me), when the kernel
CONFIG_MICROCODE_xyz_EARLY config went away, and became just
CONFIG_MICROCODE_xyz.

The whole "check kernel config" in dracut seems to go back to 2014, so
it's been that way for almost a decade by now.

Honestly, I think the right approach may be to just remove the check
again from dracut entirely - the intent seems to be to make the initrd
smaller when people don't support microcode updates, but does that
ever actually *happen*?

There are dracut command lines, like "--early-microcode" and
"--no-early-microcode", so people who really want to save space could
just force it that way. Doing the CONFIG_xyz check seems broken.

But that's for the dracut people to worry about.

I guess we on the kernel side could help with "make install" etc, but
we've (intentionally) tried to insulate us from distros having
distro-specific installkernel scripts, so we don't really haev a good
way to pass information down to the installkernel side.

It *would* make sense if we just had some actual arguments we might
pass down. Right now we just do

        exec "${file}" "${KERNELRELEASE}" "${KBUILD_IMAGE}" System.map
"${INSTALL_PATH}"

so basically the only argument we pass down is that INSTALL_PATH
(which is just "/boot" by default).

            Linus
