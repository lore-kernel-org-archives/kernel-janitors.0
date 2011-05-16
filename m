From: Michal Marek <mmarek@suse.cz>
Date: Mon, 16 May 2011 08:19:56 +0000
Subject: Re: [PATCH v3] package: Makefile: fix perf target bug
Message-Id: <4DD0DE2C.4060806@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DCD8CE4.4090404@suse.cz> <b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com> <20110515154002.GB6274@ghostprotocols.net>
In-Reply-To: <20110515154002.GB6274@ghostprotocols.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: mfmooney@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15.5.2011 17:40, Arnaldo Carvalho de Melo wrote:
> Em Fri, May 13, 2011 at 04:41:12PM -0700, mfmooney@gmail.com escreveu:
>> From: matt mooney<mfm@muteddisk.com>
>>
>> Specify --git-dir when building perf targets to allow out-of-tree
>> builds using O=<build-dir>.
>>
>> The shell command in `git archive' had to be modified to allow proper
>> file name expansion of the files listed in MANIFEST.
>>
>> Signed-off-by: matt mooney<mfm@muteddisk.com>
>
> Michal,
>
> 	Can I have your Reviewed-by or Acked-by for this one? Assuming
> all is ok by now :)

Reviewed-by: Michal Marek <mmarek@suse.cz>

Michal
