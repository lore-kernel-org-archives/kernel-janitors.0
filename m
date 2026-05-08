Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1E3F7A80
	for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2026 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260053; cv=none; b=Bv8OR4UC8cnpSfz2+p3FaOzmS/xc6zAhWpTUbq/ZZ73fK9J+cRWv0PsB5DWQD2XKkTX9se992knYSCAEtr/TAXjoYhd6BP2yYvREpFrkxHR5+rUETX8HhZ4PtDtaUWppabv64rUNmv5g+CKM20oAIaOSC8eWqB7m0xyVQ3ejlkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260053; c=relaxed/simple;
	bh=KSBeCgGU7yXcrtT127ArXRh+zv7AaX3z/38Lqxck8vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B80M49HgbxHeDp7D2IZTg0y3Ht20qJNaxwRRcidQDy86RnrSu/b2FVipzi6uD6sar3A77fJPCMzCBpUhiWdjpcNYjAwKKopw5rwOT7lSs07tZLlZAfCuANTvrBrq3uKcDW9YBmB92tSrlDohE5rAmOh+hpDFvitTosE24uoOy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rl0F7RkH; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rl0F7RkH"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8d7e7f48499so238636285a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2026 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778260051; x=1778864851; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0/pWgvRkOq8ZUg05RX5u5/TfcrPx1Z4XyM3wAz1c/w=;
        b=Rl0F7RkHZJph810pRa287qsOFx4s/D6prfzD1id1XU+w979dLxkAfKjOIeYNaUFhZB
         08NcrBI0kfArL6bUylpTEjOwsMBXA26loPYn69ptpPdqifg5z+rfosJajO9UC02O0EmH
         oRw9AOZf6mi3Rj3OR0IFGGwcq17BGrQ+TqkKuzzclobxuu/rIGtG8PC56s1RIhFfAQFz
         PUtXbvcM8f/FY1K6ZE04ZZFRUYDSTG4T+15kATNnP3qxpfzaFCq5hWCvQlEvCbW26Vte
         oKjoiPlum7TPa41ChuUYoOZUVfnqrdQ84oArvxIhrDBLR1eQnLC1eSyND6CpS45RynPr
         RKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260051; x=1778864851;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0/pWgvRkOq8ZUg05RX5u5/TfcrPx1Z4XyM3wAz1c/w=;
        b=ogXrSn+x1X94fyxmEIu7E0APP7VhxM17ce0SJwbNqCIylm68c1FjaAVvQ6gmuuYUcU
         QudsFLE0RuTrDzYujmYmLB17NopFX1wieMi/+R/7sGgLCtmL/tYoxMx3imEVhifSoYgc
         tZOUiy0UXuCjWNSMa4xYsZfKda8wLEr523/Nk7VOm527XSHeE6j5oVyEydKKHp/byn8i
         DcxgJfJsS1aR8nzUnBIjxDFNVbqp3WZxU2qIcW81KssZnmCCgOOSsR3H960e7+PnpkqC
         G8u3Tbg4MmSun7VJz49LeD1fcSIOI1QWtDeAIswGBRobb+gosGnC9jTg8+9EGAc7gsUP
         RD/g==
X-Gm-Message-State: AOJu0Yy8IiBGjHeiwGdMV9278WAInV08MUHc/SqTFy7DXgw/TAxblrFt
	2rpj/GpWU0FU+CODIp3kqqzFNNOyVZ73yfOsIMHqoCiWjPKv6PcR3HeG
X-Gm-Gg: AeBDiespEIs7sJeDigygtG1ZZG8Zg2FoHRoZZmqZ+CzKJHm9oLgwtJWLcLGKHyhhDhl
	pKpxnzjSWXJJnL0H3GuYGcb7C6fpQKq1QzZsKnPG6TnwJIYTwL2sSMm40WzwxZIpWsPPGgodHTp
	xgZCWweuT+QKsX2auaz5mVtkppt56S4JbiSfI6QIMpuhC5QU5F0fv734mxtVAnlHLuoIaBrmi01
	IILz8sVFIHf+Oi3UySgDU8CwYySm30IXcMtsqzgtuWs7taFqK6X1rWC/PJqatsynZWH9DyhGiBg
	b9aAA5uepsPjkCPtS/6Ca2dhGCw7xVANBlfTnnc6MPGWP86UuYIEBwFgJKg1PoTqfpNFqBKWnXX
	IwLf7oGXVwRc09WNF9tfZ3Ew0RRAloITJswkil+w+0ojnikO9MJv9y027rdeCofsPHforPxoobz
	tD5rBqF2fDBLKtTqF4dw==
X-Received: by 2002:a05:620a:454d:b0:8cd:7952:d449 with SMTP id af79cd13be357-904d5f00d9emr2062170885a.29.1778260051225;
        Fri, 08 May 2026 10:07:31 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8e98521sm258206485a.17.2026.05.08.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:07:30 -0700 (PDT)
Date: Fri, 8 May 2026 20:07:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] bootconfig: init: Allow admin to use bootconfig for
 kernel command line
Message-ID: <af4YTUrDM-ciyoa-@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Masami Hiramatsu,

Commit 51887d03aca1 ("bootconfig: init: Allow admin to use bootconfig
for kernel command line") from Jan 11, 2020 (linux-next), leads to
the following Smatch static checker warning:

	init/main.c:368 xbc_snprint_cmdline()
	use scnprintf() instead of snprintf()

init/main.c
    331 static int __init xbc_snprint_cmdline(char *buf, size_t size,
    332                                       struct xbc_node *root)
    333 {
    334         struct xbc_node *knode, *vnode;
    335         char *end = buf + size;
    336         const char *val, *q;
    337         int ret;
    338 
    339         xbc_node_for_each_key_value(root, knode, val) {
    340                 ret = xbc_node_compose_key_after(root, knode,
    341                                         xbc_namebuf, XBC_KEYLEN_MAX);
    342                 if (ret < 0)
    343                         return ret;
    344 
    345                 vnode = xbc_node_get_child(knode);
    346                 if (!vnode) {
    347                         ret = snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
    348                         if (ret < 0)
    349                                 return ret;
    350                         buf += ret;

In user space snprintf() can return negative, but in the kernel, no.
It returns the number of bytes (not counting the NUL terminator) which
would have been copied if there were enough space.  So maybe you want
to do something like:

	remain = rest(buf, end);
	ret = snprintf(buf, rest(buf, end), "%s ", xbc_namebuf);
	if (ret >= remain)
		return -ENOSPC;

Or maybe you might want to use scnprintf() which returns the number of
bytes actually copied.  Otherwise bug ends up pointing to beyond the end
of the buffer.

    351                         continue;
    352                 }
    353                 xbc_array_for_each_value(vnode, val) {
    354                         /*
    355                          * For prettier and more readable /proc/cmdline, only
    356                          * quote the value when necessary, i.e. when it contains
    357                          * whitespace.
    358                          */
    359                         q = strpbrk(val, " \t\r\n") ? "\"" : "";
    360                         ret = snprintf(buf, rest(buf, end), "%s=%s%s%s ",
                                ^^^^^^^^^^^^^^^
Same.

    361                                        xbc_namebuf, q, val, q);
    362                         if (ret < 0)
    363                                 return ret;
    364                         buf += ret;
    365                 }
    366         }
    367 
--> 368         return buf - (end - size);
    369 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
