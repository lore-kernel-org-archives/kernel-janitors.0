Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E5230D35
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 07:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551332; cv=none; b=kkKpUlQ/7LWomqatLuO1wTtRgzPIkOqQzsceroHeOO8zPuiheXp+B0rLNo5jsO7BBizaVGJskdlqyHCzIqNhCWdpZPMlFU8+DgofJvtw9d9Dyk0Efs714xUs6maVxiERP5sqHDdfDKXURkUOxAxmdCNrKlu7hvD/w8JD7uj9PA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551332; c=relaxed/simple;
	bh=M/D9L7h7segnrkos5KQocwnWfHngIf0buMo+VwbAX00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xtpnj0oBFYTA9EkAoP0sWtC3fQtgDRKPdwBO/EBA3WW64/L6Ff/RJ1F/TTmk0ZA0xSMzfboAiABTxptzFXHxuP7418J6A2iVvWnZGb1R2Baca3uJ866HCnOEr235EyhBiNAmqrTueSXd9JEtYuT+1JCxrv8jvuk7CZ5fL52Bs0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IC9Ht17C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IC9Ht17C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b794a013bcso437893f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754551329; x=1755156129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g3HLjmAlx40U0gLagutzbpJitgljWYj41KcMcgwX6dg=;
        b=IC9Ht17C8r/2IfKq2TC2lX2ABLNe0Ayo7aGXHcuiIZSWBdnBYVYCLIRh8K8LolKQao
         xkTGxrYWjVxpOgQ0ssojZej6PjV8lQDbEZPdx7MF3y+y4A+GztqYtIvCs+Hlu3Ib8iiS
         L0oXe321KiFaw1qr2Q7JD4Dk4HHDFNSRoYuW4leXR9kvvc8EM4Z8lkI0hAPDtcFNunx7
         QYsarQvdW8VM19v4y8Tg1DCp0JraDIEQLzLko/rEV7dVbDrxqb9QTOPfYGm6mm8bl5zj
         YXBErvk9+HkCDnTDyS5gctCezwz1/LDphVRlNAXgWAuzAb2scRYsxUZrRA54BGRTd5YE
         9BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754551329; x=1755156129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3HLjmAlx40U0gLagutzbpJitgljWYj41KcMcgwX6dg=;
        b=bY2Qc1AjB4IYG1k+68MQ3+Ro2gNeutyGhoi8S2/ZnVUJuhVTCcoWLfa3dcAUfVhpdu
         I7IckWNSPli1wXlYQC+SJx7hUIXJa9vFE5zGsgv7191+2V+YMXJSdRGoQCPz6JP8g9te
         beqcr6cLhJMgLTAfbAXOqsIWjjle2QdAfrS2gtRlMBGG/sqCeSJdbE6+PkBD0GQ72xKV
         NQObbF51WKtNO404h6RlPWNOigh3LD9ol+7gO+8BKphlLN9fYnl1CvvSmYsatdM2ijw8
         QbFrCOPlUVoOSILV8wiCg9kepmIkRhGJIdvmtnOP5oIHA4+juvK+zJ/0j3kj3y0Na+fT
         fgsg==
X-Forwarded-Encrypted: i=1; AJvYcCWraHhhKh17l++1fpgL26ergE0BOZPoc569hC3NDmIP5Vd6L3F2ufmMInbq6l5HqGDlwwS8uCLZ7mDhFSuMcFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzewhrosNvSEvZp3Oucd4ehLl3nFNn8VuS82/pyc+3Vm6X1P9vi
	zKt0sGAekVethQ7e8jQnEhESZZUrSO5s1UQPNI8HYDT/eku80fOlwWl1jJh485C/Dts=
X-Gm-Gg: ASbGncvSL0DR2yDmFqPYZA2RS/TKgNX+zzbu5GWxtQmB2g4YYXHQhFsUhsMpoWJLJQh
	6sR2YhlchMbOqh6FRnJPtQCgAYYo7JgU5j3ZimdRQecywX2EouMIbqdwMeNl/NZbpJHDxdiWVIm
	kanXyqzKyz+/kRcJekva6J5wIRWAlVCDU+pZB6/Qi68AK6lq6bIzHFx57IaTrDpAHsygLToIny/
	cfnaKSO8UAhxiEZtGHgpEpPGE2LSiikf3c9jiluhtA6Iy+u4WFgKyF/9r9l7zDqpE7LlnMVBopD
	A/nT31VOOwiyRoWMmP2Q25yPhDnz4EvSaP9Fi/kjluw8mFXIYUKo3E99JNuVLAdfcKWtRROxLQB
	+sWXviun7LThad7gOGYzdFpKw5fY=
X-Google-Smtp-Source: AGHT+IFJF9ft/V2r8XW39a98Jr3iwGd1g5e1eaqEtg/nNxjGVTa00pRrYeAhFMDLhO2CCiMXpsg1ww==
X-Received: by 2002:a05:6000:2893:b0:3b7:8b1b:a9d5 with SMTP id ffacd0b85a97d-3b8f493d8b1mr4634736f8f.51.1754551328550;
        Thu, 07 Aug 2025 00:22:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0a24bf1sm108977615e9.1.2025.08.07.00.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:22:07 -0700 (PDT)
Date: Thu, 7 Aug 2025 10:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Metzmacher <metze@samba.org>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: Using smatch and sparse together (Re: [PATCH next] smb: client:
 Fix use after free in send_done())
Message-ID: <d3b63d25-1b03-4c7c-85cc-efd9d74c3a8a@suswa.mountain>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
 <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
 <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>
 <a1a0046c-f47f-4e8a-ae3c-85db58a6cb2f@suswa.mountain>
 <df4905fb-933e-4055-8363-d6427515773b@samba.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df4905fb-933e-4055-8363-d6427515773b@samba.org>

On Thu, Aug 07, 2025 at 08:34:09AM +0200, Stefan Metzmacher wrote:
> Am 06.08.25 um 16:39 schrieb Dan Carpenter:
> > On Wed, Aug 06, 2025 at 04:17:41PM +0200, Stefan Metzmacher wrote:
> > > > > What was the test that triggered the problem?
> > > > > Or did you only noticed it by looking at the code?
> > > > 
> > > > This was a Smatch static checker warning.  You need to have the cross
> > > > function DB to detect it.
> > > 
> > > Ok, I'll try to integrate it into my build flow...
> > > 
> > > Does it replace sparse or does it run in addition?
> > 
> > In addition.  I find the Sparse endianness checks especially useful.
> > 
> > > If it replaces sparse I guess a small script would
> > > run them both?
> > > 
> > > $ cat mychecker.sh:
> > > #!/bin/bash
> > > set -e
> > > sparse $@
> > > smatch $@
> > > 
> > > And maybe all others from
> > > https://gautammenghani.com/linux,/c/2022/05/19/static-analysis-tools-linux-kernel.html
> 
> I'm using this now:
> 
> $ cat custom-checker.sh
> #!/bin/bash
> 
> set -e
> 
> which sparse > /dev/null 2>&1 && {
>         sparse -Winit-cstring -Wsparse-error $@
> }
> 
> which smatch > /dev/null 2>&1 && {
>         smatch -p=kernel --fatal-checks $@

I would say don't do fatal checks...  I don't love that option at all.
It was for another project which limits which checks it enables.

> }
> 
> $ cat build-fs-smb.sh
> make modules_prepare
> make -j16 M=fs/smb CF=-D__CHECK_ENDIAN__ W=1ce C=1 KBUILD_MODPOST_WARN=1 KCFLAGS="-Wfatal-errors" CHECK="$(pwd)/custom-checker.sh" $@
> 
> 
> I'm currently getting these warnings:
> 
> client/sess.c:436 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'
> client/sess.c:444 cifs_chan_update_iface() warn: iterator used outside loop: 'iface'

This code is fine.  It's quite hard for Smatch to parse
	if (list_entry_is_head(iface, &ses->iface_list, iface_head)) {
correctly.

> client/inode.c:1703 cifs_root_iget() warn: passing zero to 'ERR_PTR'

Huh...  This warning showed up in 2023 and I didn't report it.  I
probably should have.

fs/smb/client/inode.c
  1693  iget_root:
  1694          if (!rc) {
  1695                  if (fattr.cf_flags & CIFS_FATTR_JUNCTION) {
  1696                          fattr.cf_flags &= ~CIFS_FATTR_JUNCTION;
  1697                          cifs_autodisable_serverino(cifs_sb);
  1698                  }
  1699                  inode = cifs_iget(sb, &fattr);

Should this have been:

		inode = cifs_iget(sb, &fattr);
		if (!inode)
			rc = -EINVAL;

  1700          }
  1701  
  1702          if (!inode) {
  1703                  inode = ERR_PTR(rc);
  1704                  goto out;
  1705          }

> client/inode.c:2295 cifs_mkdir() warn: passing zero to 'ERR_PTR'

Returning ERR_PTR(0) means reporting NULL and it's an idiom in fs/.
But outside of fs/ then most times it is a bug.  So the warning is
useful, but in fs/ it's often deliberate like it is here.

> server/smb2pdu.c:3754 smb2_open() warn: Function too hairy.  No more merges.
> server/smb2pdu.c:3754 smb2_open() parse error: Function too hairy.  Giving up. 18 seconds
> 

Yeah.  Ignore these.

> Is there a way to use --fatal-checks but turn the 'too hairy' and maybe others into a warning only?
> Something like -Wno-error=... in gcc.

Yeah.  Let me disable those unless --spammy is enabled.  They're for
debugging only and I'm probably the only person who is interested in
them.

> 
> Or at least turn this into an error:
> client/smbdirect.c:292 send_done() error: dereferencing freed memory 'request' (line 290)
> Without --fatal-checks smatch still returns 0.
> 

Sure.  To be honest, I normally build with the --succeed option which
is the opposite of --fatal-checks.

> While this returns an error (without --fatal-checks):
> server/smb2pdu.c:3754 smb2_open() warn: Function too hairy.  No more merges.
> server/smb2pdu.c:3754 smb2_open() parse error: Function too hairy.  Giving up. 8 seconds
> 
> Currently I typically use git rebase -i and then have some like this
> 
> exec bash build-fs-smb.sh C=0
> pick 123456 my first patch
> exec bash build-fs-smb.sh
> pick 654321 my 2nd patch
> exec bash build-fs-smb.sh
> 
> So I force C=0 on the initial run in order to avoid hitting the fatal Function too hairy
> and it then works with my default of C=1 if I don't change fs/smb/server/smb2pdu.c
> (or with --fatal-checks and other file that has a warning)
> 
> I'd actually prefer to use --fatal-checks and C=1 in all cases
> in order to notice problems I'm introducing...

I use the scripts/new_bugs.pl script.  After I've looked at the day's
warnings then I run `scripts/new_bugs.pl --store err-list` and only
review them again when I modify a file.

> 
> > > How often do I need to run smatch_scripts/build_kernel_data.sh on the whole kernel?
> > 
> > The cross function database is really useful for just information
> > purposes and looking at how functions are called.  You probably
> > would need to rebuild it four or five times to get useful
> > information, unfortunately.  I rebuild my every night on the latest
> > linux-next.
> 
> I have the following files generated on a fast machine:
> 
> $ ls -alrt smatch_*
> -rw-r----- 1 metze metze     303104 Aug  6 15:42 smatch_db.sqlite.new
> -rw-rw-r-- 1 metze metze    3107065 Aug  6 16:37 smatch_compile.warns
> -rw-rw-r-- 1 metze metze 2848012813 Aug  6 16:37 smatch_warns.txt
> -rw-rw-r-- 1 metze metze 6016192672 Aug  6 16:38 smatch_warns.txt.sql
> -rw-rw-r-- 1 metze metze 4202917492 Aug  6 16:39 smatch_warns.txt.caller_info
> -rw-r--r-- 1 metze metze 8757637120 Aug  6 16:57 smatch_db.sqlite
> 

Your DB is 8GB.  If you rebuild it enough times, then eventually the
DB will max out at 32GB.  If it gets to be over 40GB then my builds
stop finishing in one night so I investigate and shrink it again...
It's a cycle of adding code until things slow down too much and then
optimizing it to make it bearable again.

> I copied them all to my laptop where I develop my patches
> and was able to reproduce the error :-)
> 
> Do I need copy all of these or is smatch_db.sqlite enough?

Yep.  Only smatch_db.sqlite.  I should probably delete the other
files after the DB has been built.

> 
> Would it be possible that you share your generated file(s)
> via a download, that might be useful for a lot of people.
> 

The DB is too big and too dependent on your .config but I should
share the smatch_data/ more regularly.  I started to push that into
a separate git repo but I didn't finish that work.  I should do
that.

regards,
dan carpenter

