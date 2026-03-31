Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243A3ACF15
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Mar 2026 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957695; cv=none; b=nTi/4Px13IjxFmpca4mvG4Nf3zintk0EdXVEoW/b4jsktPWY+gaBUxlVYQPmyAl1vTR1mOiiIJKjn14ukbQrtycXepI9GBPFQvlIg+dAOM2tfQCKkVWJc9UxGK5ybWefKP8MgiaYxPRls+Ajr3NnGWZhEHOL5NFd7dXcPYa1S88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957695; c=relaxed/simple;
	bh=kb3dmRrdjEc0vozXKRM+YpwyCulKU+mbnoEmFwDDaGk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=RSvu+heImgd8iLzmmmXwJYk+cK4MW7ppduIgP98oI4lvNilTEedB/w3o06i2VytO+PvysYJAU1eSEpBhP4HoLbDheVihPbs5D96ryx/OVeHHESWnmMQE01fxUttTWdwQA0Xf1ZOBnqntnqZPELp7uVt1sFQB/TFLNwvE6iHQzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=y6oCB4YL; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="y6oCB4YL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yioqD31UswXkYo7PMEJWxeds8F5h4BKKSwKFl8D0rCM=; b=y6oCB4YLGtodqlWfhPO/ccni7A
	SHlqzs0OK9BALvxUWPZvXLYaPHGG7KvQqD4mI7Cpwft7OoZvLvGdscISDDjE41of/bCkKg9EgVsg7
	mvOwNX3twmYzeyiYFcIZ/diIxMF7M+U1AVLXl0gZ0uxs4JnPmC+c5+uaHdFZWQtCpEojifeHBCz42
	mKQe/Jf7V8YmyKjM1ku3BydL1hCGnkcziRMe7jf8tXU1TTo7sZp4X8XhRly6dgZ6/CaONshFRsWNl
	dCLe3pKW4Yx9zx+Dietf5U2FSVtN8FGq8jO6n8QXsR7vF/O7Bctp94qIbdSbZ6ATq2PTxvdiCxd9q
	2te+Oqqw==;
Received: from [147.129.179.166] (port=57746 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w7XZn-00000004LKW-3ZVF
	for kernel-janitors@vger.kernel.org;
	Tue, 31 Mar 2026 07:48:08 -0400
Date: Tue, 31 Mar 2026 07:49:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: more potential janitor work: simplifying test for power of 2
Message-ID: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  As another example of a cleanup script I wrote lo those many years
ago, this one checked if someone was manually testing if a value was a
power of two (do not make fun of my coding):

#!/bin/sh

DIR=${1-*}

echo "PATTERN:     x & (x - 1):\n"
grep -Ern "([^\(\)]+) ?\& ?\(\1 ?- ?1\)" ${DIR}
echo "PATTERN:     x & ((x) - 1):\n"
grep -Ern "([^\(\)]+) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}
echo "PATTERN:     (x) & (x - 1):\n"
grep -Ern "\(([^\(\)]+)\) ?\& ?\(\1 ?- ?1\)" ${DIR}
echo "PATTERN:     (x) & ((x) - 1):\n"
grep -Ern "\(([^\(\)]+)\) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}

  As you can see, the typical hacky check was to test the value of
some variant of "n & (n - 1)" to see if n was in fact a power of 2.
Note that, when run from the top of the kernel source tree, you can
focus the search on any subdirectory.  There is a ton of this sort of
thing scattered throughout the kernel source; for example:

$ test_for_power_of_2.sh drivers/net/ethernet
PATTERN:     x & (x - 1):

drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c:756:	if (eq->num_elem_in_pg & (eq->num_elem_in_pg - 1)) {
drivers/net/ethernet/huawei/hinic/hinic_hw_wq.c:456:	if (num_q_pages & (num_q_pages - 1)) {
drivers/net/ethernet/huawei/hinic/hinic_hw_wq.c:523:	if (q_depth & (q_depth - 1)) {
drivers/net/ethernet/huawei/hinic/hinic_hw_wq.c:620:	if (q_depth & (q_depth - 1)) {
drivers/net/ethernet/huawei/hinic/hinic_hw_api_cmd.c:872:	if (attr->num_cells & (attr->num_cells - 1)) {
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:691:	if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:697:	if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:702:	if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:709:	if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_rule.c:680:		byte_mask = byte_mask & (byte_mask - 1);
drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:163:	if (!length || (length & (length - 1)) ||
drivers/net/ethernet/sfc/siena/siena_sriov.c:505:	return ((buf_count & (buf_count - 1)) || buf_count > max_buf_count);
drivers/net/ethernet/sfc/siena/siena_sriov.c:956:	BUG_ON(vf->evq0_count & (vf->evq0_count - 1));
drivers/net/ethernet/broadcom/bnxt/bnxt.c:4736:	while (pages & (pages - 1))
drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c:1230:#define POWER_OF_2(x)	((0 != x) && (0 == (x & (x-1))))
drivers/net/ethernet/synopsys/dwc-xlgmac-common.c:110:	if (pdata->tx_desc_count & (pdata->tx_desc_count - 1)) {
drivers/net/ethernet/synopsys/dwc-xlgmac-common.c:118:	if (pdata->rx_desc_count & (pdata->rx_desc_count - 1)) {
drivers/net/ethernet/freescale/fman/fman_keygen.c:700:	if (hash_size == 0 || (hash_size & (hash_size - 1)) != 0) {
drivers/net/ethernet/chelsio/cxgb4/sge.c:5094:	    (fl_large_pg & (fl_large_pg-1)) != 0) {
drivers/net/ethernet/chelsio/cxgb4vf/sge.c:2649:	    (fl_large_pg & (fl_large_pg - 1)) != 0) {
drivers/net/ethernet/chelsio/cxgb/cxgb2.c:657:		if (advertising & (advertising - 1))
drivers/net/ethernet/emulex/benet/be.h:136:	BUG_ON(limit & (limit - 1));
drivers/net/ethernet/intel/igc/igc_leds.c:156:	if (flags & (flags - 1))
drivers/net/ethernet/intel/igc/igc_ethtool.c:1286:	    (rule->filter.match_flags & (rule->filter.match_flags - 1)))
drivers/net/ethernet/intel/fm10k/fm10k_tlv.c:203:	if (!msg || !len || len > 8 || (len & (len - 1)))
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1917:	if ((table->mem_table.depth & (table->mem_table.depth - 1)) != 0) {
PATTERN:     x & ((x) - 1):

PATTERN:     (x) & (x - 1):

PATTERN:     (x) & ((x) - 1):

  This can be simplified using the kernel header file
include/linux/log2.h, which defines the test using an exclusive-OR
operation:

/**
 * is_power_of_2() - check if a value is a power of two
 * @n: the value to check
 *
 * Determine whether some value is a power of two, where zero is
 * *not* considered a power of two.
 * Return: true if @n is a power of 2, otherwise false.
 */
static __always_inline __attribute__((const))
bool is_power_of_2(unsigned long n)
{
	return n - 1 < (n ^ (n - 1));
}

  Lots of simplification there if one wants some janitor work; I don't
see a coccinelle test for this.

rday
