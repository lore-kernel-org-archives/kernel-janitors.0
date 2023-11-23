Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E1410DA;
	Wed, 22 Nov 2023 20:07:52 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r610G-00073o-E4; Thu, 23 Nov 2023 05:07:48 +0100
Message-ID: <27dc9607-fed3-4eb2-8c09-d8caf669cc1e@leemhuis.info>
Date: Thu, 23 Nov 2023 05:07:47 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: lukas.bulwahn@gmail.com
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
In-Reply-To: <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700712472;8e67d1a9;
X-HE-SMSGID: 1r610G-00073o-E4

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 12.11.23 16:03, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
>> Commit e6bcfdd75d53 ("x86/microcode: Hide the config knob") removes config
>> MICROCODE_AMD, but left some references that have no effect on any kernel
>> build around.
>>
>> Clean up those remaining config references. No functional change.
>> [...]
> 
> That patch became 4d2b748305e96f ("x86/microcode: Remove remaining
> references to CONFIG_MICROCODE_AMD"). Not totally sure, but from briefly
> looking into things it seems likely that it causes a regression with
> dracut that was just reported here:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=218136

Linus doesn't consider this to be something that needs to be fixed (see
the "from a user perspective things should still continue to work."
later in this thread), so remove this from the tracking:

#regzbot resolve: Linus considers this nothing that needs fixing
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
