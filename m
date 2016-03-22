From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Tue, 22 Mar 2016 08:08:46 +0000
Subject: Re: [PATCH] openvswitch: Fix checking for new expected connections.
Message-Id: <20160322080846.GA1341@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1458584119-2693-1-git-send-email-jarno@ovn.org>
In-Reply-To: <1458584119-2693-1-git-send-email-jarno@ovn.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarno Rajahalme <jarno@ovn.org>
Cc: netfilter-devel@vger.kernel.org, kernel-janitors@vger.kernel.org, dev@openvswitch.org

On Mon, Mar 21, 2016 at 11:15:19AM -0700, Jarno Rajahalme wrote:
> OVS should call into CT NAT for packets of new expected connections only
> when the conntrack state is persisted with the 'commit' option to the
> OVS CT action.  The test for this condition is doubly wrong, as the CT
> status field is ANDed with the bit number (IPS_EXPECTED_BIT) rather
> than the mask (IPS_EXPECTED), and due to the wrong assumption that the
> expected bit would apply only for the first (i.e., 'new') packet of a
> connection, while in fact the expected bit remains on for the lifetime of
> an expected connection.  The 'ctinfo' value IP_CT_RELATED derived from
> the ct status can be used instead, as it is only ever applicable to
> the 'new' packets of the expected connection.

Applied, thanks.
