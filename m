From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Date: Sun, 15 May 2011 15:40:02 +0000
Subject: Re: [PATCH v3] package: Makefile: fix perf target bug
Message-Id: <20110515154002.GB6274@ghostprotocols.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DCD8CE4.4090404@suse.cz>
 <b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com>
In-Reply-To: <b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mfmooney@gmail.com
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Fri, May 13, 2011 at 04:41:12PM -0700, mfmooney@gmail.com escreveu:
> From: matt mooney <mfm@muteddisk.com>
> 
> Specify --git-dir when building perf targets to allow out-of-tree
> builds using O=<build-dir>.
> 
> The shell command in `git archive' had to be modified to allow proper
> file name expansion of the files listed in MANIFEST.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>

Michal,

	Can I have your Reviewed-by or Acked-by for this one? Assuming
all is ok by now :)

- Arnaldo
