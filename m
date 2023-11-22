Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iL7k/MxK"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68C8F9
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 12:36:15 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso311502a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 12:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700685374; x=1701290174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTFW+4h4lZJz6rbXAaizRdJw1t8O20ELX/WfD27HXjM=;
        b=iL7k/MxKz93XWTxiuAXIXhZe6aGQGrmJ1K9ihaq2M2Jwsj85MoNk1Ctw6X7/Lcd4eg
         9WSw61PsrjB33WlFl6eOEP2jf3NfkLcO3Hdq6LjrLV68cAdjThJpxlcIV7iHaaqE8nXI
         SCXKXqxjF+Isd0/ypOeHHZI+sq6IZe9yF9oPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700685374; x=1701290174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTFW+4h4lZJz6rbXAaizRdJw1t8O20ELX/WfD27HXjM=;
        b=VAtcsZji2r8mf+a2woBmjUZmm49wk2nsndzct2cTLQJz8a5a1qM4LtP15n0lh/rrG4
         RquHVHfSC0JMnUqNJ8RtT79r9r3G1y2xuHX8zkUMItpZcSwdO3IsKVoQR4zpKddViQJ+
         onAZ0wzeCVungm4VUfVOKycph5mkrY671H0K0q+4pFiENGqk5ToF7RtvCap/J3PAWODF
         hLR/0ZjzA2Sb09j5U4RnI8di4pjGH+7+fV2ii8xNvhkQsf9tQjn//W5a+svbM5rwFVNc
         gN91ie/2QTytIKGCXJUEfe/qpfyo9IxlObFzVuROZdsHD0cQoejWkffiunpBgzNihdWQ
         A4Pw==
X-Gm-Message-State: AOJu0Ywj4ycy/Z75vJKp91gTjqOTz8H6R1uMk0CHJcvK0kE/vdKRUwud
	E8f8eUeGNQ+BfZDGQOnIoLn9wJdSBG1RD6szw11Aq9Al
X-Google-Smtp-Source: AGHT+IGIzZb8kqteTAyNmn2lBDAq++osstLS/bMwZKHvtoW3KZ7K8//vVmXbJpAErARUe8NS36y+mw==
X-Received: by 2002:a17:907:b9ca:b0:9ff:c5c9:8d14 with SMTP id xa10-20020a170907b9ca00b009ffc5c98d14mr1256356ejc.41.1700685373930;
        Wed, 22 Nov 2023 12:36:13 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709060b4a00b009b928eb8dd3sm181299ejg.163.2023.11.22.12.36.12
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:36:13 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso280530a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Nov 2023 12:36:12 -0800 (PST)
X-Received: by 2002:a05:6402:34c5:b0:548:615c:33aa with SMTP id
 w5-20020a05640234c500b00548615c33aamr2977402edc.20.1700685372660; Wed, 22 Nov
 2023 12:36:12 -0800 (PST)
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
In-Reply-To: <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Nov 2023 12:35:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
Message-ID: <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to CONFIG_MICROCODE_AMD)
To: Borislav Petkov <bp@alien8.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, lukas.bulwahn@gmail.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 07:58, Borislav Petkov <bp@alien8.de> wrote:
>
> IMO, yes, we should not break userspace but dracut is special. And it
> parses willy nilly kernel internals which are not ABI to begin with.

I don't think the "dracut is special" is the thing that matters.

The real issue is that hey, if dracut in its incompetence doesn't
include the microcode on the initrd, that doesn't really matter much.
It's fairly easily fixable, and at worst it will mean that we end up
having CPU mitigations that aren't optimal. Since most of those are BS
anyway, it really doesn't seem critical.

Sure, it's a "regression" in that you don't get the microcode update
included, but from a user perspective things should still continue to
work.

End result: this seems to be pretty solidly a distro issue.

IOW, the whole "users are the only thing that matters" pretty much
means that it's a non-issue. Things continued to work, to the point
that I'm actually surprised anybody even noticed.

That said, I don't think some ELF note is the fix either. I think we
might as well leave it at CONFIG_MICROCODE. Maybe add a note in the
kernel Kconfig that this thing matters for dracut.

Dracut also checks for CONFIG_ACPI_INITRD_TABLE_OVERRIDE. It's a
similar "normal users don't care".

              Linus
