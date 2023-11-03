Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB714293;
	Fri,  3 Nov 2023 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9523D4E;
	Fri,  3 Nov 2023 03:25:54 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qyrN4-00055B-3O; Fri, 03 Nov 2023 11:25:46 +0100
Date: Fri, 3 Nov 2023 11:25:46 +0100
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] netfilter: nf_tables: fix pointer math issue in
 nft_byteorder_eval()
Message-ID: <20231103102546.GB8035@breakpoint.cc>
References: <15fdceb5-2de5-4453-98b3-cfa9d486e8da@moroto.mountain>
 <20231103091801.GA8035@breakpoint.cc>
 <ZUTBNcA7ApLu5DMA@calendula>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUTBNcA7ApLu5DMA@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Fri, Nov 03, 2023 at 10:18:01AM +0100, Florian Westphal wrote:
> > Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > The problem is in nft_byteorder_eval() where we are iterating through a
> > > loop and writing to dst[0], dst[1], dst[2] and so on...  On each
> > > iteration we are writing 8 bytes.  But dst[] is an array of u32 so each
> > > element only has space for 4 bytes.  That means that every iteration
> > > overwrites part of the previous element.
> > > 
> > > I spotted this bug while reviewing commit caf3ef7468f7 ("netfilter:
> > > nf_tables: prevent OOB access in nft_byteorder_eval") which is a related
> > > issue.  I think that the reason we have not detected this bug in testing
> > > is that most of time we only write one element.
> > 
> > LGTM, thanks Dan.  We will route this via nf.git.
> 
> Thanks for your patch.
> 
> One question, is this update really required?

I think so, yes.  Part of this bug here is that this helper-niceness
masks whats really happening in the caller (advancing in strides of
'u32', rather than 'u64').
