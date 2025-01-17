Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED0197A92
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115329; cv=none; b=A1HSfMBxMcvOteCiF7el3n3l2VQcnUqoNAK3Cf9TVpju9FTp7Zbrnvr9EKmuhXobMB/2YLQtgrMDXS6cxQO5k1A8vrszTYzuNDMKAqTqnDdHA+o6k+VXwi5Q4M3sSnd95792YrLYWYehfCzVyi16Xd8FKs/SWnJRuyB+TvG4wW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115329; c=relaxed/simple;
	bh=B36lzTHwzwym7Qp8/ANAOGUp2C+nG4U0c3q0yiKI5hI=;
	h=From:Message-ID:Date:MIME-Version:To:Subject:Cc:Content-Type; b=S4bqGWJ7m/E30Bg9j/EHuijKXC3CLyHoJS7YtoJf6/KU2s9xTwtrUXmv+2b1iBgy3eG/VOAK1Gj7jzn2uynBA7qVmHHcKiBVgy78zOEiOOoYn16lMMHgAbhB5GnEr/V0wAmIQaRG7+80GtY5G2co+b1RteYJJSLuGjeJUIFN/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4BEJqKr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4BEJqKr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeef97ff02so349127566b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 04:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737115325; x=1737720125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:organization:to
         :content-language:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/iHd3/+ZrB6RUNkQTBvNusQcUd9AfECOTPnyFCfG/k=;
        b=Z4BEJqKraifefSNIpG5ph+g005A4vprb76q0yOGygGCC6wlUriOMJs1b62hM0aujVE
         B3EvHNWePWbcqQwxdZuIwUfru/ecWKwDlGHt1y1YKW6DHGXofM3dsA0i6r75uWIy0JnE
         iowIdmLU2xuv2bDSz23nJk4b6kH7eDTEEHrp6lDKdZcj9UrVBhGsPpI/Z5iriVXy2jAN
         jrPhZR8UrV3vqC1oFeI4kQvyOsPjEC1/2Z2Kd33dEvvCk+ZYnqxvo5uJU5OBMjxL8T7w
         lvRQBfAwiw8kaU78XWu6JCEI3ExnN+7GjWfLjPmpQyV11fjqKLxjCUdBIFEUqYWlRiQ+
         3OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737115325; x=1737720125;
        h=content-transfer-encoding:cc:subject:organization:to
         :content-language:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/iHd3/+ZrB6RUNkQTBvNusQcUd9AfECOTPnyFCfG/k=;
        b=nOw+Wq0f+w81HXE2l1mDrvWudsDH9XJE9B7LxVe51AJdIShnzEyJtej5Zo8mO6Sx3L
         6ACx6lYVJeaFf/tpwKtO9n2zX+/IKeIkz9lMoIB+wJUPgT9JCCv22xQzqCBpMGp1MZgj
         pfcbh71hpHKcyrdGN+ficzRTT17Xz5uIKqslIb1LHpe9IzleJgX7+1LImYDKNUcYMHTV
         2WdVxZm1Kn0Iv6RqIx2wqWz+ZQPD2mshnfyE/r1sIGSZxFn5GnUnbXxwSyqEkZvCyXWm
         OIiry23ZuNADdR+QQ6jet/EsdqZq8s6yxPdhZ+wY9xf5Dn9+uptW4pIvFjhiS3AHCSxQ
         3YuQ==
X-Gm-Message-State: AOJu0YzRGdTS19vCTUzg92HlK2sS/IyU/Ntj7l5IcO1X8+1wY2eOexcf
	A98P8lUvLIW1vhjhRWszVkKbZmxz0f4dJw/rOk1hVAzg92Sf+5pQWLP9jg==
X-Gm-Gg: ASbGncvDAEffsVOxunMomnOFlYehUmnYLQ2Rw6qHeapdY10FwlvGokTL+XEEHelCNdp
	w7AIDyvCktiZ47/dS510nh5jMRmE+4njNghvu1y/f3abae1Uhi3xNIISAG00Kis8dKkfB+HXJss
	0UK7CS4NlYTjqVZZwlQH9ZqoKGUYPMOp2ZV7IsmekcOm+hV5yKfKgTd9XfOr9Vn531n/iFrh6CF
	W5TNUEpXV6MzA7wpogFgN6Bcb34GbrUT7qt1h1U8UJ35d+Lv0xMDRtf0rdjmJ6sEv4z
X-Google-Smtp-Source: AGHT+IHyRbbpetEcNMKv5uKUYe75P9eRfYCujKIYvSMhrTNMq/7kN9WV8JQOcgEnqKEstEyuZ/P07Q==
X-Received: by 2002:a17:906:6a25:b0:aaf:afb3:ad63 with SMTP id a640c23a62f3a-ab38b44e0e2mr221450366b.43.1737115324818;
        Fri, 17 Jan 2025 04:02:04 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2cf9bsm159711366b.86.2025.01.17.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 04:02:04 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <9344a80d-4e90-4190-b973-e3347caae87f@orange.com>
Date: Fri, 17 Jan 2025 13:02:03 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Mozilla-News-Host: news://127.0.0.1:1119
Content-Language: fr, en-US
To: kernel-janitors@vger.kernel.org
Organization: Orange
Subject: Bug: broken /proc/kcore in 6.13
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Somewhere in the 6.13 branch (not bisected yet, sorry), it stopped being
possible to disassemble the running kernel from gdb through /proc/kcore.

More precisely:

 - look up a function in /proc/kallsyms => 0xADDRESS
 - tell gdb to "core /proc/kcore"
 - tell gdb to "disass 0xADDRESS,+LENGTH" (no need for a symbol table)

 * if the function is within the main kernel text, it is okay
 * if the function is within a module's text, an infinite loop happens:


Example:

 # egrep -w ice_process_skb_fields\|ksys_write /proc/kallsyms
 ffffffffaf296c80 T ksys_write
 ffffffffc0b67180 t ice_process_skb_fields       [ice]

 # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffaf296c80,+256" -ex quit
 ...
 Dump of assembler code from 0xffffffffaf296c80 to 0xffffffffaf296d80:
   ...
 End of assembler dump.

 # gdb -ex "core /proc/kcore" -ex "disass 0xffffffffc0b67180,+256" -ex quit
 ...
 Dump of assembler code from 0xffffffffc0b67180 to 0xffffffffc0b67280:
 (***NOTHING***)
 ^C <= inefficient, need kill -9


Ftrace (see below) shows in this case read_kcore_iter() calls vread_iter() in an
infinite loop:

        while (true) {
                read += vread_iter(iter, src, left);
                if (read == tsz)
                        break;

                src += read;
                left -= read;

                if (fault_in_iov_iter_writeable(iter, left)) {
                        ret = -EFAULT;
                        goto out;
                }
        }

As it turns out, in the offending situation, vread_iter() keeps returning 0,
with "read" staying at its initial value of 0, and "tsz" nonzero. As a
consequence, "src" stays stuck in a place where vread_iter() fails.

A cursory "git blame" shows that this interplay (vread_iter() legitimately
returning zero, and read_kcore_iter() *not* testing it) has been there from
quite some time. So, while this is arguably fragile, possibly the new situation
lies in the actual memory layout that triggers the failing path.

To add weigh to this hypothesis, I forced "breaking out" of the loop in that
case, see patch below, but while this cures the loop, all such attempts (on
module-text addresses) lead to a zero return from vread_iter(), as though some
internal (in-kernel) permission barrier prevented access to those areas.


diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index e376f48c4b8b..8c5f29240542 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -531,7 +531,13 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct
iov_iter *iter)
                         * again until we are done.
                         */
                        while (true) {
-                               read += vread_iter(iter, src, left);
+                               long res;
+                               res = vread_iter(iter, src, left);
+                               if (!res) {
+                                       ret = -EFAULT;
+                                       goto out;
+                               }
+                               read += res;
                                if (read == tsz)
                                        break;



Thanks for any insight, as this completely breaks debugging the running kernel
in 6.13.

-Alex


------------
# tracer: nop
#
# entries-in-buffer/entries-written: 0/0   #P:48
#
#           TASK-PID     CPU#     TIMESTAMP  FUNCTION
#              | |         |         |         |
           <...>-3304    [045]    487.295283: kprobe_read_kcore_iter:
(read_kcore_iter+0x4/0xae0) pos=0x7fffc0b6b000
           <...>-3304    [045]    487.295298: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295326: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295329: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295338: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295339: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295345: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295347: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
           <...>-3304    [045]    487.295352: kretprobe_vread_iter:
(read_kcore_iter+0x3e6/0xae0 <- vread_iter) arg1=0
           <...>-3304    [045]    487.295353: kprobe_vread_iter:
(vread_iter+0x4/0x4e0) addr=0xffffffffc0b67000 len=384
...



