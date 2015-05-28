From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:15 +0000
Subject: [PATCH 0/9] drop unneeded goto
Message-Id: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, HPDD-discuss@lists.01.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-nfs@vger.kernel.org, linux-wireless@vger.kernel.org

These patches drop gotos that jump to a label that is at the next
instruction, in the case that the label is not used elsewhere in the
function.  The complete semantic patch that performs this transformation is
as follows:

// <smpl>
@r@
position p;
identifier l;
@@

if (...) goto l@p;
l:

@script:ocaml s@
p << r.p;
nm;
@@

nm := (List.hd p).current_element

@ok exists@
identifier s.nm,l;
position p != r.p;
@@

nm(...) {
<+... goto l@p; ...+>
}

@depends on !ok@
identifier s.nm;
position r.p;
identifier l;
@@

nm(...) {
<...
- if(...) goto l@p; l:
...>
}
// </smpl>

