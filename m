Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C781FD7
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 00:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708475078; cv=none; b=t71hdZrw7zqBPP/M/1e+W6W/VHETryjyZF5eXk4t3cC5ygJucIxDHsRCfFa/kfpWxh5azft5vSyS+3dare5vs7XHWqi2qbhvlNSuOboLppqeW6fFxkBL5HLKxIhkslgkaEtuxmfCV7PHERG+vR1t47odYcBVplt48yA3CStkBls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708475078; c=relaxed/simple;
	bh=zsiqJVD8oee1LKgxlDnHQs9RnisiRpL2ecY5NmMQxOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRosP76vraAthQQeG/kRau/hOfG75r8ZZbxUF043WItNuQVSe9l3ZlOsALsoxrbo+yJTDPM9+FKQ2VvYrMMdKiWcoYr1NLLHp8si4IiJMZ98Wdf9j/LTnfhI0MwGtzMIfrBeEQ6KOl4ielP7DBzv6Nq/Vhe4LVdR2by4CiWKTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bdJIQrr5; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bdJIQrr5"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-363acc3bbd8so5719015ab.1
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 16:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708475075; x=1709079875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOLRAEsEthL2VkcOa5sVWiNqOGf453ZXNU0bFPj6SWs=;
        b=bdJIQrr5yR0VtuRNOGu3RlXAI0YFw2K0YKF/2JH1slb0K6b7i/HBf2LigUvdICJlWb
         ZgHi1PogfebfF6Ooc8YQy13rbtZl3kf/WJp6+UQRattiaOnxKsJxeSVDF2/O8ORv0Qou
         xoX7lI/0jn8Zwa2mz/EgUY511hPEV/3aEZa74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708475075; x=1709079875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOLRAEsEthL2VkcOa5sVWiNqOGf453ZXNU0bFPj6SWs=;
        b=MMiMo4Nan1A1OvXlmvPb7tVFnppnbeVDRQ7qFlTIxNWB2LU7dyA65GAiHOyn2JHQio
         qqQezyH/BMK0yTYcXhcx9VLn8Is8n94x+uwxXFssUcyzD4reX9/8e/0uinOKeSwzJiqN
         eWf+TdbLpZKUT/pumcWtW5tIqcoNf1S8e7MN7bE3eJuEE/ci85N7DOTPbXr/StXrYmnK
         IP9Su/AkZp477rRlAYN5xCsKuXOUaDyNnFqbPaijKrxkLN4XnC8Cs0Ep+gNA65GKVwxb
         5UW92TGIOKQP3e+/awbyUY3WqiCk8tnzb6W9s3acP+eS/aUiVRz0+7ZmUlDnN4LVEkCp
         gyjw==
X-Gm-Message-State: AOJu0Yy/6aRXEn9CCewmbuAN/1L8durCCYYgTwnOz5z+Y9zb3IBR8qGo
	9gOFEt86EFaB3McNEqVd2Tzw0Zu1zwJM7s2VDr1RmvvaHIMJgXPBfkgtJVdfDb4=
X-Google-Smtp-Source: AGHT+IElgvmFms2RUxC0f+WggghxFIAH9xb37cmGwTuvln1obru77PAXe5n3hv/3FSNOhGNNjOkskA==
X-Received: by 2002:a6b:c844:0:b0:7c7:224e:ae90 with SMTP id y65-20020a6bc844000000b007c7224eae90mr12520260iof.0.1708475075513;
        Tue, 20 Feb 2024 16:24:35 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id u25-20020a02cb99000000b0047158a50c8csm2402736jap.133.2024.02.20.16.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 16:24:35 -0800 (PST)
Message-ID: <ab3e1d41-f3e7-406c-8de5-426bcd2ba602@linuxfoundation.org>
Date: Tue, 20 Feb 2024 17:24:34 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] selftests: sched: Fix spelling mistake "hiearchy"
 -> "hierarchy"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240220092323.2677156-1-colin.i.king@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240220092323.2677156-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/24 02:23, Colin Ian King wrote:
> There is a spelling mistake in a printed message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/testing/selftests/sched/cs_prctl_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
> index 7ba057154343..62fba7356af2 100644
> --- a/tools/testing/selftests/sched/cs_prctl_test.c
> +++ b/tools/testing/selftests/sched/cs_prctl_test.c
> @@ -276,7 +276,7 @@ int main(int argc, char *argv[])
>   	if (setpgid(0, 0) != 0)
>   		handle_error("process group");
>   
> -	printf("\n## Create a thread/process/process group hiearchy\n");
> +	printf("\n## Create a thread/process/process group hierarchy\n");
>   	create_processes(num_processes, num_threads, procs);
>   	need_cleanup = 1;
>   	disp_processes(num_processes, procs);

Applied to linux-kselftest next for Linux 6.9-rc1

thanks,
-- Shuah
