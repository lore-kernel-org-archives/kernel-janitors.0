Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1028C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 16:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD0D661005
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 16:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhCaQNv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:13:51 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:46902 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhCaQNi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Mar 2021 12:13:38 -0400
Received: by mail-wr1-f48.google.com with SMTP id v4so20222654wrp.13
        for <kernel-janitors@vger.kernel.org>; Wed, 31 Mar 2021 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=i9krFiQbDcpBdYtkSgOhV2VBqoEqvjb7HmSp8nCDAE4=;
        b=UyhNHSKAuaiPUS9uec5FED/eN5PBMMGDUw6K6abmmbtLLDuYK+bFG1DZicBURTzLPj
         LR7VKmics30fwgQLMHw2+zb5rlrVz2XG9xOu2LfFUqxo3st8OMTfuVj6A5UKL5NaFqA3
         hNaXALAa6vz+zxr4p9i1aaU7c6f+05Ssj54uG/0IXPwgkO8ybxOMha5j5t33ypFT1k3G
         S1HazurW0wsS9FpFYaZ9EyErqsN2ujJcOp5rzGeezlYAW8p65kNZnZwDZfFRLq1Qy4qS
         QUrpAy3M+fzE5os03JqV0/5fFKh0Sl5iJ4HknuzojelyJAuys0XOnbflwua0YhFSaXl2
         rgYw==
X-Gm-Message-State: AOAM531Nc10uKB6dO0QO38t5vxL0SSRCD/0zAkccPXuo9j9QMSOOdxjy
        KnFv7MyTeN2ttG6uX8QRrHE=
X-Google-Smtp-Source: ABdhPJygoy9s6ljUbg8cgpf4W9+WBP0DtVHmgJmhEDXxJSkKf4dK6cOsFlmLCFI9Th+f0hQQC11slg==
X-Received: by 2002:adf:ea47:: with SMTP id j7mr4442694wrn.377.1617207217485;
        Wed, 31 Mar 2021 09:13:37 -0700 (PDT)
Received: from [10.9.0.22] ([46.166.128.205])
        by smtp.gmail.com with ESMTPSA id j6sm4304191wmq.16.2021.03.31.09.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 09:13:36 -0700 (PDT)
Reply-To: alex.popov@linux.com
Subject: Re: Exploitable bugs in AF_VSOCK implementation
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Julia Lawall <Julia.Lawall@inria.fr>
References: <b57de8d1-e62b-cf74-89b8-c7a3b73b9cc0@linux.com>
 <20210331152600.GQ2088@kadam>
From:   Alexander Popov <alex.popov@linux.com>
Message-ID: <3284e8d9-0788-664a-a66b-f65861eee13d@linux.com>
Date:   Wed, 31 Mar 2021 19:13:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331152600.GQ2088@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 31.03.2021 18:26, Dan Carpenter wrote:
> Hi Alexander,
> 
> I enjoyed reading your blog entries for CVE-2017-2636 and CVE-2019-18683.

Hello Dan, thanks!

> https://lore.kernel.org/lkml/20210201084719.2257066-1-alex.popov@linux.com/
> 
> My understanding is that you were able to write a privilege escalataion
> bug for this?  Are you going to do a write up for this one as well?

Yes, I will give a talk about my exploit for CVE-2021-26708 at Zer0Con and
publish the article next week:
https://zer0con.org/#speaker-section

I'm finishing the article right now.

> Was the trick to exploiting it to use the free in vsock_deassign_transport()?

Yes!

> I've wanted to look for these in Smatch (my static analysis tool) for a
> long time.  I wrote a very naive first draft implementation.  What it
> looks for is when we access struct sock members before calling
> lock_sock().  It generated 8 warnings.  Six were false positives but I
> think that two were probably real bugs.

Cool!

> net/nfc/llcp_sock.c:313 nfc_llcp_getsockopt() warn: unlocked access 'llcp_sock->local' expected lock '&sk->sk_lock.slock'
> net/nfc/llcp_sock.c:597 llcp_sock_release() warn: unlocked access 'llcp_sock->local' expected lock '&sk->sk_lock.slock'
> 
> But I think it would be hard to exploit those because the race is very
> tiny.

I can't say about these two cases, but for CVE-2021-26708 the race window is huge.

To hit the race condition I have two pthreads that work in parallel:
 - 1st pthread calls lock_sock() and performs some work with the virtual socket;
 - 2nd pthread saves the value to a local variable and hangs on lock_sock(),
since the lock is already acquired.

When the first pthread finishes the work and releases the lock, the second
pthread is able to finish lock_sock() and proceed with the out-of-date value in
the local variable.

Maybe this strategy can be used in the cases that you detected.

> Several people (maybe most recently Lukas Bulwahn but someone else at
> Linux Plumbers) suggested that a way to find race conditions is to look
> at the line directly after taking a lock.  So if you have:
> 
> 	mutex_lock(&dsp->pwr_lock);
> 	if (!dsp->wmfw_file_name || !dsp->booted)
> 
> Then that means that the ->pwr_lock is protecting ->wmfw_file_name and
> ->booted.  So I wrote a check that made a list of these sorts of
> pairings.  Then I wrote a check that said:
> 
> If you take save a "protected" struct member and then take the lock
> print a warning that the access should have been inside the lock.  So a
> warning looks like this:
> 
> sound/pci/cs46xx/cs46xx_lib.c:2148 snd_cs46xx_spdif_default_get() warn: unlocked access 'ins' (line 2146) expected lock '&chip->spos_mutex'
>   2142  static int snd_cs46xx_spdif_default_get(struct snd_kcontrol *kcontrol,
>   2143                                          struct snd_ctl_elem_value *ucontrol)
>   2144  {
>   2145          struct snd_cs46xx *chip = snd_kcontrol_chip(kcontrol);
>   2146          struct dsp_spos_instance * ins = chip->dsp_spos_instance;
>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Smatch is saying this assignment should have been done
> 
>   2147  
>   2148          mutex_lock(&chip->spos_mutex);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> inside this lock.
> 
>   2149          ucontrol->value.iec958.status[0] = _wrap_all_bits((ins->spdif_csuv_default >> 24) & 0xff);
>   2150          ucontrol->value.iec958.status[1] = _wrap_all_bits((ins->spdif_csuv_default >> 16) & 0xff);
>   2151          ucontrol->value.iec958.status[2] = 0;
>   2152          ucontrol->value.iec958.status[3] = _wrap_all_bits((ins->spdif_csuv_default) & 0xff);
>   2153          mutex_unlock(&chip->spos_mutex);
>   2154  
>   2155          return 0;
>   2156  }
> 
> That seems probably true but also a pretty harmless.  I've attached a
> sample of the output just in case you're curious.
> 
> Do you have any idea how I could get more worthwhile results than this?

I would also propose to use your approach and search for access to "protected"
struct fields after UNlock functions.

Best regards,
Alexander
