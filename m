From: matt mooney <mfmooney@gmail.com>
Date: Sun, 12 Jun 2011 18:19:34 +0000
Subject: Re: [PATCH v3] package: Makefile: fix perf target bug
Message-Id: <BANLkTikvuRwWwb3aux25Ut6ycr0VefrHFQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DCD8CE4.4090404@suse.cz>
	<b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com>
	<20110515154002.GB6274@ghostprotocols.net>
	<4DD0DE2C.4060806@suse.cz>
In-Reply-To: <4DD0DE2C.4060806@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 16, 2011 at 1:19 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 15.5.2011 17:40, Arnaldo Carvalho de Melo wrote:
>>
>> Em Fri, May 13, 2011 at 04:41:12PM -0700, mfmooney@gmail.com escreveu:
>>>
>>> From: matt mooney<mfm@muteddisk.com>
>>>
>>> Specify --git-dir when building perf targets to allow out-of-tree
>>> builds using O=3D<build-dir>.
>>>
>>> The shell command in `git archive' had to be modified to allow proper
>>> file name expansion of the files listed in MANIFEST.
>>>
>>> Signed-off-by: matt mooney<mfm@muteddisk.com>
>>
>> Michal,
>>
>> =A0 =A0 =A0 =A0Can I have your Reviewed-by or Acked-by for this one? Ass=
uming
>> all is ok by now :)
>
> Reviewed-by: Michal Marek <mmarek@suse.cz>

I do not believe this patch ever got picked up!

Thanks,
matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
