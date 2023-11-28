Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XV6WGWkV"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697E1D60
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 05:12:30 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso2975608f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 05:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701177149; x=1701781949; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzQ/+Uc+FQD2lsxDXwEgSBDJ9V0A/AfDJynn8aEnG2Y=;
        b=XV6WGWkVcYWacmCrjiRb7J6goSFkbX+b6bcwbfXWmylkGgvhtER5BQBHU90EQi0RIv
         p9jb+npCmzlMa5jPn2u+IenVMPTpVq37djov2nyFYnU4mClPl0gECxIajc40C31P4Heu
         jR7SUn0xeLrmb9pIv+N1Ie6DNNuIrdcKBqjNO95SxPgV1k6gRAyDXvR+g5y2KpZUrZ9v
         nDWQDJsbVzF2nPqktR2iSwS5zgNhUatHl1uP2T6H2+4+uNGK+OKCoMyLNHJCK8j4zo2F
         ofarlrP5krXDjP1t+9BMnH5GRlbgBspykojlxHC6EmCsSFEWM6BGwS54JufqPsyjeQ7R
         ss+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177149; x=1701781949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzQ/+Uc+FQD2lsxDXwEgSBDJ9V0A/AfDJynn8aEnG2Y=;
        b=LLNj5T6YInLisoDZioprIGts6TnHQfnXxnwp5eZ94S+m+Ex4uka2zgYKu1GhxVLFg5
         4p7/a7ad/PGjBpMLqssv6D9eXaDC4nYxoBWbi8xQlumo41SRhqk/oouYXb0oBxkrEv3A
         FioYK8Z5GTdmoO34cGRuYDibKRzyl1rFx/5ViaiPaQLf2tvt4pKC0PwEIV5ftwLCDv+e
         Ourw6OdTd7Abe7SKseAcngP2Ha83aAVukMvTRJ1POZaXh9EToL3HIG5jPPXTNoKykdxt
         TF1o9d+ANyHA8yUNij/DsMyI6lnZVbalBW9/Ma6BTVgkmXzX1NZyfDEXd+8Ebe+Yb7Gw
         a7Rg==
X-Gm-Message-State: AOJu0Yx3NO8TCcdNalC3oJsn+H6ug3KRfohGccNhJ0ZVPq8wGrnP6Umz
	3eYOPwY/LZIL1yFokQN2NSBpXH0bUyGu23EZC7vxMO/3
X-Google-Smtp-Source: AGHT+IG1DYt3sodKiFi40Jt7EIUF098EELcomjkRQfv/ekkYtUEWPJt1esIDh2HhxsApF+EX324StA==
X-Received: by 2002:a5d:5f85:0:b0:333:51b:d7b8 with SMTP id dr5-20020a5d5f85000000b00333051bd7b8mr4921893wrb.10.1701177148828;
        Tue, 28 Nov 2023 05:12:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600001c600b00332ff21038fsm6526944wrx.106.2023.11.28.05.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 05:12:28 -0800 (PST)
Date: Tue, 28 Nov 2023 16:12:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tony.luck@intel.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] x86/split_lock: Make life miserable for split lockers
Message-ID: <6bc08e77-812f-4e9e-938a-6a13263ce9d1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tony Luck,

The patch b041b525dab9: "x86/split_lock: Make life miserable for
split lockers" from Mar 10, 2022 (linux-next), leads to the following
Smatch static checker warning:

	arch/x86/kernel/cpu/intel.c:1179 split_lock_warn()
	warn: sleeping in atomic context

arch/x86/kernel/cpu/intel.c
    1158 static void split_lock_warn(unsigned long ip)
    1159 {
    1160         struct delayed_work *work;
    1161         int cpu;
    1162 
    1163         if (!current->reported_split_lock)
    1164                 pr_warn_ratelimited("#AC: %s/%d took a split_lock trap at address: 0x%lx\n",
    1165                                     current->comm, current->pid, ip);
    1166         current->reported_split_lock = 1;
    1167 
    1168         if (sysctl_sld_mitigate) {
    1169                 /*
    1170                  * misery factor #1:
    1171                  * sleep 10ms before trying to execute split lock.
    1172                  */
    1173                 if (msleep_interruptible(10) > 0)
    1174                         return;
    1175                 /*
    1176                  * Misery factor #2:
    1177                  * only allow one buslocked disabled core at a time.
    1178                  */
--> 1179                 if (down_interruptible(&buslock_sem) == -EINTR)
    1180                         return;
    1181                 work = &sl_reenable_unlock;
    1182         } else {
    1183                 work = &sl_reenable;
    1184         }
    1185 
    1186         cpu = get_cpu();
    1187         schedule_delayed_work_on(cpu, work, 2);
    1188 
    1189         /* Disable split lock detection on this CPU to make progress */
    1190         sld_update_msr(false);
    1191         put_cpu();
    1192 }

The call tree is:

kernel_exc_vmm_communication() <- disables preempt
-> vc_raw_handle_exception()
   -> vc_forward_exception()
      -> exc_alignment_check()
         -> __exc_alignment_check()
            -> handle_user_split_lock()
               -> split_lock_warn()

I think maybe the mismatch is that kernel_exc_vmm_communication() calls
irqentry_nmi_enter(regs); which disable preemption but exc_alignment_check()
does local_irq_enable() which doesn't enable it.

Also why does arch/x86 not have a dedicated mailing list?

regards,
dan carpenter
