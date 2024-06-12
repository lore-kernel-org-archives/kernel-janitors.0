Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F75757F8
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182204; cv=none; b=cWPI5cJinoRCCtozrBy39hNIIeHtxzxe4IC3B9Jd9hwlCp7AJVfx5cj/UqjYToGy81sQH2cTd07242HngfvPRAjLVxD1oRlcwFCRb8S/zbc/3GSxS4N+iNgyaUgjXRbWldTrUVX85RWMhIszjR/JRbGMG4GjRy6yUjAMw5QxgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182204; c=relaxed/simple;
	bh=b14JE8Hd1cKYDo7Y7AIGAOjh0QSV12BCe651HRE/Krk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdqAF4sH19PSjxxoDO3URMiCLTynAlxhy7ZHJrT5LbSPP6R2ukC05P8IgoVhbN4p8gj64XGRcIdPqRYlPVj9UBnWR0dJQ1SOgCdT0aGcXoy73xVaJdztkHMzTRE9F4gs1nQJipuXoX9kega5X+RqwZ1MPtMyCqZTkRgVtLpDleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hqJDE1As; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqJDE1As"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso5235776f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718182201; x=1718787001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KblFtxoLOYdOj133hsBDEfsyDTDk4K9GtWvFG0mVigs=;
        b=hqJDE1AssGN+vj8hfCZOPwRj8MJF46bgIP1ZT9BZotdbYAQE3dKdk+tX+yRzAACRFc
         2AquzzDpcNXuaUaWmUdKam59gmflrGnVtAi0ia1u5dYgD5Vlp/OJkG6U2Sv31f1YYEMj
         U0GpfcwODeszj+HX0rMpML9ZY+geCxfVesLjfU2U/ebohF1gd5LknW1btCDxH049PKoU
         nqpIatfjMuQur2kbk4G85JQFwVuNSKns+eezezUzebQwrEnYEi1JcoOoYEjZZsyCdulQ
         V0Bkb4TD0kEXe6SHNb+l+OoQXUaqBLbuOPUpy42qDOKTz1pTrFVue2DoTVK7Tli15sZO
         4Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182201; x=1718787001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KblFtxoLOYdOj133hsBDEfsyDTDk4K9GtWvFG0mVigs=;
        b=bJR6tbatZBXpj+B9/l1K8Dl2W8nOUW89Gz/LDNKAdG5OvIo3ayb3DR7JClK169L1Tp
         2BWFFXdD9njUv9mVmie3zN+1kNNgimNo5Fa8Vu3lNiEkUXUBhhgyzUu5/bQaEEa+2E/2
         EGX9wd9vOaiCgs2vTv7EpyFW/D/cs8DjDDEl64Es5Zg/vWSJo7/yWI8BawxMp77WQ5/L
         Sblpfm/gCv6XKdi0h7ZYHNiEgVXIGSthFSrQjSxlDQsO/3hNMDUM3RJ/UUg7jY8aim4z
         kHQvU7TMAnmXKRmZgtwoX/IDNFyWEWQp8RLI6ijiGmlQMJ5cGIW47xgN7tiEmhqePusf
         oR2w==
X-Forwarded-Encrypted: i=1; AJvYcCXXnITVIQB8FguklTLhm9H0v+aC7YkHyOL58j+5FNInCT4CErcS5MgGwUQ6MYDvzdqQoGGGqS/WmjoMtxY3b3nmA9uYrFzTwXMXxnWjYkdi
X-Gm-Message-State: AOJu0Yz9dka8uD0FG2qFRh3AGrqK1FXjI8dYkmoriZ7OpSaH3fklRuIJ
	xnsZG6NotN8Khk3pNWeK+SXwhngbtncYgfx8nTDMixSxOLmdQqsYclzVcFrnLxc=
X-Google-Smtp-Source: AGHT+IEuW4Qt0F2C34adTuf4Iw0RgJsE7gOJQJAtCM1xxw0xSETRwNKL24J5NNVEkQTJOvaASbj0VQ==
X-Received: by 2002:a5d:47a9:0:b0:35f:bcc:98ed with SMTP id ffacd0b85a97d-35fdf79a152mr942011f8f.6.1718182200506;
        Wed, 12 Jun 2024 01:50:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f26578176sm6812313f8f.11.2024.06.12.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:50:00 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:49:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
	Sasha Levin <sashal@kernel.org>, Tom Gall <tom.gall@linaro.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5] checkpatch: check for missing Fixes tags
Message-ID: <6825db9f-be27-4096-9723-6ad65342a59e@moroto.mountain>
References: <ZmhUgZBKeF_8ixA6@moroto>
 <20240611113855.b63a6015b26a0dad49d9f2a7@linux-foundation.org>
 <b3baa059-b433-42da-96c0-588312b5a4ac@leemhuis.info>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3baa059-b433-42da-96c0-588312b5a4ac@leemhuis.info>

On Wed, Jun 12, 2024 at 08:46:24AM +0200, Thorsten Leemhuis wrote:
> On 11.06.24 20:38, Andrew Morton wrote:
> > On Tue, 11 Jun 2024 16:43:29 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > 
> >> This check looks for common words that probably indicate a patch
> >> is a fix.  For now the regex is:
> >>
> >> 	(?:(?:BUG: K.|UB)SAN: |Call Trace:|stable\@|syzkaller)/)
> >>
> >> Why are stable patches encouraged to have a fixes tag?  Some people mark
> >> their stable patches as "# 5.10" etc.  This is useful but a Fixes tag is
> >> still a good idea.
> > 
> > I'd say that "# 5.10" is lame
> 
> Documentation/process/stable-kernel-rules.rst documents this use to
> "Point out kernel version prerequisites".
> 

No, the 5.10 means that the fix is required for everything after 5.10.
Here is how you reference pre-requisites.

    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic

The documentation was written before we went to 12 character hashes and
also these days we normally put ("") around the subject.  I've made a
copy of all the uses of this format from 2023 at the bottom of this
email to see how people use it in real life.

> > and it would be good if checkpatch could
> > detect this and warn "hey, use a proper Fixes:".  Because
> > 
> >> It  helps people to not cherry-pick buggy patches without also
> >> cherry-picking the fix.
> > 
> > seems pretty important.
> 
> Hmmm. That would lead to false positive when it comes to changes that
> for example just add a device ID (and thus do not "Fix" anything) while
> having prerequisites that are only available in a specific version.

What I'm saying is, imagine you are maintaining a distro kernel for
10 years.  In this scenario you're pulling in whole new wifi drivers
so the kernel still runs on modern hardware.  The stable tag says
"apply this to 6.8+" because that's when the driver was merged.  But as
a distro maintainer it's much nicer to have a Fixes: 123412341234 ("Add
new wifi driver").

regards,
dan carpenter

Dependencies listed in 2023:

    Cc:  <stable@vger.kernel.org> # 6.1.x: 3837a03 serial: sc16is7xx: improve regmap debugfs by using one regmap per port
    Cc:  <stable@vger.kernel.org> # 6.1.x: 3837a03 serial: sc16is7xx: improve regmap debugfs by using one regmap per port
    Cc: <stable@vger.kernel.org> # 6.6+: f8ff234: kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP
    Cc: <stable@vger.kernel.org> # v6.0+: 1da5c9b x86: Introduce ia32_enabled()
    Cc: stable@vger.kernel.org # 6.6.x: c5dbf0416000: platform/x86: hp-bioscfg: Simplify return check in hp_add_other_attributes()
    Cc: stable@vger.kernel.org # 6.6.x: 5736aa9537c9: platform/x86: hp-bioscfg: move mutex_lock() down in hp_add_other_attributes()
    Cc: <stable@vger.kernel.org> # selftests/resctrl: Refactor feature check to use resource and feature name
    Cc: <stable@vger.kernel.org> # selftests/resctrl: Remove duplicate feature check from CMT test
    Cc: <stable@vger.kernel.org> # selftests/resctrl: Move _GNU_SOURCE define into Makefile
    Cc: stable@vger.kernel.org # 5.9.x: 09252177d5f9: SUNRPC: Handle major timeout in xprt_adjust_timeout()
    Cc: stable@vger.kernel.org # 5.9.x: 7de62bc09fe6: SUNRPC dont update timeout value on connection reset
    Cc: stable@vger.kernel.org # 0b035401c570: rbd: move rbd_dev_refresh() definition
    Cc: stable@vger.kernel.org # 510a7330c82a: rbd: decouple header read-in from updating rbd_dev->header
    Cc: stable@vger.kernel.org # c10311776f0a: rbd: decouple parent info read-in from updating rbd_dev
    Cc: <stable@vger.kernel.org> # 6.1.y: bf0207e172703 ("drm/amdgpu: add S/G display parameter")
    Cc: <stable@vger.kernel.org> # 6.1.y: bf0207e172703 ("drm/amdgpu: add S/G display parameter")
    Cc: <stable@vger.kernel.org> # 5.15.x: 60a0aab7463ee69 arm64: module-plts: inline linux/moduleloader.h
    Cc: stable@vger.kernel.org # 588159009d5b: rbd: retrieve and check lock owner twice before blocklisting
    Cc: stable@vger.kernel.org # f38cb9d9c204: rbd: make get_lock_owner_info() return a single locker or NULL
    Cc: stable@vger.kernel.org # 8ff2c64c9765: rbd: harden get_lock_owner_info() a bit
    Cc: 6.4+ <stable@vger.kernel.org> # 6.4+: 8bcbb18c61d6: thermal: core: constify params in thermal_zone_device_register
    Cc: stable@vger.kernel.org # please backport to all LTSes but not before v6.6-rc2 is tagged
    Cc: stable@vger.kernel.org      # 3.18: a872ab303d5d: "usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup"
    Cc: stable@vger.kernel.org # v6.0+ 2f38e84 net/ncsi: make one oem_gma function for all mfr id
    Cc: <stable@vger.kernel.org> # 6.0: 5365cea199c7 ("soc: qcom: llcc: Rename reg_offset structs to reflect LLCC version")
    Cc: <stable@vger.kernel.org> # 6.0: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")
    Cc: stable@vger.kernel.org # 6.1.y: 5591a051b86b: drm/amdgpu: refine get gpu clock counter method
    Cc: stable@vger.kernel.org # 6.2.y: 5591a051b86b: drm/amdgpu: refine get gpu clock counter method
    Cc: stable@vger.kernel.org # 6.3.y: 5591a051b86b: drm/amdgpu: refine get gpu clock counter method
    Cc: stable@vger.kernel.org #3.2: 30332eeefec8: debugfs: regset32: Add Runtime PM support
    Cc: <stable@vger.kernel.org> # dependency for "drm/rockchip: vop: Leave
    Cc: stable@vger.kernel.org # 4.15: 30332eeefec8: debugfs: regset32: Add Runtime PM support
    Cc: <stable@vger.kernel.org> # v5.19+ (if someone else does the backport)
    CC: stable@vger.kernel.org # 5.4.x: c8a5f8ca9a9c: btrfs: print checksum type and implementation at mount time
    Cc: <stable@kernel.org> # d6fd48eff750 ("virt/coco/sev-guest: Check SEV_SNP attribute at probe time")
    Cc: <stable@kernel.org> # 970ab823743f (" virt/coco/sev-guest: Simplify extended guest request handling")
    Cc: <stable@kernel.org> # c5a338274bdb ("virt/coco/sev-guest: Remove the disable_vmpck label in handle_guest_request()")
    Cc: <stable@kernel.org> # 0fdb6cc7c89c ("virt/coco/sev-guest: Carve out the request issuing logic into a helper")
    Cc: <stable@kernel.org> # d25bae7dc7b0 ("virt/coco/sev-guest: Do some code style cleanups")
    Cc: <stable@kernel.org> # fa4ae42cc60a ("virt/coco/sev-guest: Convert the sw_exit_info_2 checking to a switch-case")
    Cc: stable@vger.kernel.org      # 5.1: 680f8666baf6: interconnect: Make icc_provider_del() return void
    Cc: <stable@kernel.org> # 2355370cd941 ("x86/microcode/amd: Remove load_microcode_amd()'s bsp parameter")
    Cc: <stable@kernel.org> # a5ad92134bd1 ("x86/microcode/AMD: Add a @cpu parameter to the reloading functions")

