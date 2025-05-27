Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107AA1CEAD6
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333123; cv=none; b=S++uEhkvR5L6T+XMDpp+85UELHaovWQ7kMH1uehhFKBuqvAZA6ickuVVp02Y0diLqXFHAQpvSdnYANBeLNFT1LfC/Oca3jELKzlz7rk6ksoIFqQX0DLECcOKXf6csSWQS0nlsYhugyQrSAnX8CzX9PACwsTjNoQ4MuveiLAz2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333123; c=relaxed/simple;
	bh=NtsGL8hzNr4t+5SwLGdd88D5UCzwYbux4pP5qZhyNS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moa0lxOpD1Ge4GhTWj2GtEqP3zuZ6WmclYmwtZytNBPxJNaDlGm73hoJ0dil/S30LnjbF3mBulwQCjmK6ce4FSSMZIHKXsCvUeEeuGTdHz5fvzoghHe9xaWrQ+T0gJ7EU8lcfDwC40t52vxrB7sxCM8OKyl3n2NcREWD2QiJdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGOf9Pze; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGOf9Pze"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso298292a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748333120; x=1748937920; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSNNWxI8tZZWAUx1TW3SILu4x+AZuZUyWh+r5HFIIVo=;
        b=xGOf9PzepdMH9xf/jciPDWagMWJAxt3KjUSkUEdvt8ggLG8B3tCU/sQparLGeReOQA
         XdDYyTQeFrFgUse5hvcKmVCt/r4Vct/fVD+zSFOwrnLHwKtqlYRXVZiarkkq+wxbfY/4
         rHfZCQcB9sFKVi0Y0oVh3b+U/0BvqgxRjz82s6f4Go+1SsXK2RY+A68ADnFmam5ogwRE
         IY/Nt5Qu7t6voc7JGt9acR58ePDNrKvh18XUDH+mmtDp3EJDSaW/RzSqVmkDKng2TNY4
         MByj2zm8VGJXxgrurvYB86KpTAMgznGAdta4Vts4VK8SCepHGcx4xLK9cJjCOb/HEC7U
         oeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333120; x=1748937920;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSNNWxI8tZZWAUx1TW3SILu4x+AZuZUyWh+r5HFIIVo=;
        b=keiLa8/NlOE/3PPs28PVWlrEsUQXvdukEGYxECjf+cj290HMam/JwY/A3ThqCCwA9Z
         mBpDN7dP5xBBC/kg82EinypZMdYXnyBT/RkIO8vbilmRDgPxjpIXVmjslQG4BLeoaIfH
         IdWqrcKwzAlkcB/4srotICjSRUACp902CDFPV8TN89d724sYCzSQSrGkzCTy9MGywbkN
         X2qe7UuBWSaYOtKPlOoxUUz7rCy9e+ZY62GRZwRRKSb1mER36r+MyTACUX3IdacEaUp4
         QDg9VZUbPoxNmhLdy4RNnIhe8f8fraLIFzuHcmVYGn1yvsMEajHQYpo3iB4EOzw3E+v4
         ocgg==
X-Forwarded-Encrypted: i=1; AJvYcCXxk37C/lWd5+TPieWtcR7xDWHDOdk3wYFS/o33QSSHiVXI69tfj8b2j9Oftd3ThnVIu5e3Nuz5pONufYmRQOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBksY7EaPO6xf4/Hnan3ysSE6SAgejBWOL3Rt8BOMaJDoxwYi
	+Ei+KDT695tvQ2GRoPD9ovps5VLU1K1SGMIc2+zrd7paHsjeVReUdfEdtEq6DXWZdWC+C0imgDE
	D8ZwU
X-Gm-Gg: ASbGncsEwcVYGiH+62/AjnZxjb3E6NWzqBvDcTKE4Jp1lRDfO/Cv05weXZg3mvt3rzZ
	M0Jm6dvEhz5XX4/kuVFY0SqzdvfGfZbtGav2dkG54PPOpP9+38U3k74QiZbpACln7XHirM8qzB7
	LZ0/xSVHXw/ZjWxPLQdS/Lr+bXPsCWYK1FtmDrChCL2FqLEtDp6RopKEnLNm9KDbpw9I0fuxcP7
	wHwqewYDZ9bb3g2HQzoxhqE/25YVYZJb2DSouRxNjCrB11BX2IpUwZ7YI8B0mCm/Lbv62eek/Xj
	BEpuK5pwV1rR8wPtmes/IEAhUbaJ549rQqVzDuJuQ1IyUNP2yowLxhb+fwcoN2aJJmX2eZJtVXI
	=
X-Google-Smtp-Source: AGHT+IHjDaKZCbVxkWqlylB5hVB9rhMfmT73cZGURsVMgNyHwGx82sECwEv0Q1f5Tm9Yzpf65RZbeQ==
X-Received: by 2002:a17:906:3e15:b0:ad8:7ecd:65e6 with SMTP id a640c23a62f3a-ad87ecd65femr316543766b.10.1748333120202;
        Tue, 27 May 2025 01:05:20 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad5d2340d44sm778302066b.142.2025.05.27.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:05:19 -0700 (PDT)
Date: Tue, 27 May 2025 11:05:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-janitors@vger.kernel.org
Subject: [bug report] misc: amd-sbi: Add support for CPUID protocol
Message-ID: <aDVyO8ByVsceybk9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Akshay Gupta,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?

drivers/misc/amd-sbi/rmi-core.c
   110  static int rmi_cpuid_read(struct sbrmi_data *data,
   111                            struct apml_cpuid_msg *msg)
   112  {
   113          struct cpu_msr_indata input = {0};
   114          struct cpu_msr_outdata output = {0};
   115          int val = 0;
   116          int ret, hw_status;
   117          u16 thread;
   118  
   119          mutex_lock(&data->lock);
   120          /* cache the rev value to identify if protocol is supported or not */
   121          if (!data->rev) {
   122                  ret = sbrmi_get_rev(data);
   123                  if (ret < 0)
   124                          goto exit_unlock;
   125          }
   126          /* CPUID protocol for REV 0x10 is not supported*/
   127          if (data->rev == 0x10) {
   128                  ret = -EOPNOTSUPP;
   129                  goto exit_unlock;
   130          }
   131  
   132          thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;

CPUID_MCA_THRD_INDEX is 32.
CPUID_MCA_THRD_MASK is 0xffff.

Smatch complains that msg->cpu_in_out is user data but we're shifting
away some bits which is suspicious (but can be fine).  But then the
result of the shift mask we save in thread is always zero.

   133  
   134          /* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
   135          if (thread > 127) {
   136                  thread -= 128;
   137                  val = 1;
   138          }
   139          ret = regmap_write(data->regmap, SBRMI_THREAD128CS, val);
   140          if (ret < 0)
   141                  goto exit_unlock;
   142  
   143          prepare_cpuid_input_message(&input, thread,
   144                                      msg->cpu_in_out & CPUID_MCA_FUNC_MASK,

Maybe it was suppoesd to be just "& CPUID_MCA_FUNC_MASK" without the
shift?

   145                                      msg->cpu_in_out >> CPUID_EXT_FUNC_INDEX);
   146  
   147          ret = regmap_bulk_write(data->regmap, CPUID_MCA_CMD,
   148                                  &input, CPUID_WR_REG_LEN);
   149          if (ret < 0)


[ snip ]

   353  static int apml_rmi_reg_xfer(struct sbrmi_data *data,
   354                               struct apml_reg_xfer_msg __user *arg)
   355  {
   356          struct apml_reg_xfer_msg msg = { 0 };
   357          unsigned int data_read;
   358          int ret;
   359  
   360          /* Copy the structure from user */
   361          if (copy_from_user(&msg, arg, sizeof(struct apml_reg_xfer_msg)))
   362                  return -EFAULT;
   363  
   364          mutex_lock(&data->lock);
   365          if (msg.rflag) {
   366                  ret = regmap_read(data->regmap, msg.reg_addr, &data_read);
   367                  if (!ret)
   368                          msg.data_in_out = data_read;
   369          } else {
   370                  ret = regmap_write(data->regmap, msg.reg_addr, msg.data_in_out);
   371          }
   372  
   373          mutex_unlock(&data->lock);
   374  
   375          if (msg.rflag && !ret)
   376                  return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
                               ^^^^^^^^^^^^
copy_to/from_user() returns the number of bytes that it wasn't able to
copy.  This should be:

	if (ret)
		return ret;

	if (msg.rflag) {
		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
			return -EFAULT;
	}

	return 0;

   377          return ret;
   378  }

regards,
dan carpenter
