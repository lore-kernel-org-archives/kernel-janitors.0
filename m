Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991F7C433E6
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C0E64E86
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238529AbhCCGGj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 01:06:39 -0500
Received: from smtprelay0056.hostedemail.com ([216.40.44.56]:47848 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1581600AbhCBS7f (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 13:59:35 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 1C213180322EC;
        Tue,  2 Mar 2021 17:46:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id E7A51181B3E89;
        Tue,  2 Mar 2021 17:42:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: home60_3c159ee276be
X-Filterd-Recvd-Size: 4972
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Tue,  2 Mar 2021 17:42:52 +0000 (UTC)
Message-ID: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
Subject: linux-kernel janitorial RFP: Mark static arrays as const
From:   Joe Perches <joe@perches.com>
To:     kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>
Cc:     LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 02 Mar 2021 09:42:51 -0800
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Here is a possible opportunity to reduce data usage in the kernel.

$ git grep -P -n '^static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[\s*\]' drivers/ | \
  grep -v __initdata | \
  wc -l
3250

Meaning there are ~3000 declarations of arrays with what appears to be
file static const content that are not marked const.

So there are many static arrays that could be marked const to move the
compiled object code from data to text minimizing the total amount of
exposed r/w data.

However, I do not know of a mechanism using coccinelle to determine
whether or not any of these static declarations are ever modified.

So it appears that each instance of these declarations might need
manual inspection.

But for arrays declared inside functions, it's much more likely that
the static declaration without const is done with the intent to modify
the array:

(note the difference in the git grep with a leading '^\s+')

$ git grep -Pn '^\s+static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[\s*\]' drivers/ | \
  grep -v __initdata | \
  wc -l
323

------------- For instance: (head -10 of the git grep for file statics)

drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };
drivers/accessibility/speakup/keyhelp.c:26:static u_char funcvals[] = {
drivers/accessibility/speakup/main.c:2059:static spkup_hand spkup_handler[] = {
drivers/accessibility/speakup/speakup_acntpc.c:35:static unsigned int synth_portlist[] = { 0x2a8, 0 };
drivers/accessibility/speakup/speakup_decpc.c:133:static int synth_portlist[] = { 0x340, 0x350, 0x240, 0x250, 0 };
drivers/accessibility/speakup/speakup_dectlk.c:110:static int ap_defaults[] = {122, 89, 155, 110, 208, 240, 200, 106, 306};
drivers/accessibility/speakup/speakup_dectlk.c:111:static int g5_defaults[] = {86, 81, 86, 84, 81, 80, 83, 83, 73};
drivers/accessibility/speakup/speakup_dtlk.c:34:static unsigned int synth_portlist[] = {
drivers/accessibility/speakup/speakup_keypc.c:34:static unsigned int synth_portlist[] = { 0x2a8, 0 };
drivers/acpi/ac.c:137:static enum power_supply_property ac_props[] = {

For drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };

masks is only used in static function say_key and should be const and
perhaps the declaration might be better moved into that function.

For drivers/accessibility/speakup/keyhelp.c:26:static u_char funcvals[] = {

funcvals is only used in static function spk_handle_help and should be const
and perhaps the declaration might be better moved into that function.

For drivers/accessibility/speakup/main.c:2059:static spkup_hand spkup_handler[] = {

spkup_handler is only used in static function do_spkup and should be const
and perhaps the declaration might be better moved into that function.

etc... for speakup

For drivers/acpi/ac.c:137:static enum power_supply_property ac_props[] = {

array ac_props is assigned as a reference in acpi_ac_add as a 
"const enum power_supply_property *" member of a struct power_supply_desc.

------------- For instance: (head -10 of the git grep for function statics)

drivers/acpi/apei/apei-base.c:781:	static u8 whea_uuid_str[] = "ed855e0c-6c90-47bf-a62a-26de0fc5ad5c";
drivers/block/amiflop.c:1051:	static unsigned char CRCTable1[] = {
drivers/block/amiflop.c:1070:	static unsigned char CRCTable2[] = {
drivers/block/drbd/drbd_nl.c:872:	static char units[] = { 'K', 'M', 'G', 'T', 'P', 'E' };
drivers/block/drbd/drbd_proc.c:224:	static char write_ordering_chars[] = {
drivers/block/drbd/drbd_receiver.c:4363:	static enum drbd_conns c_tab[] = {
drivers/char/pcmcia/synclink_cs.c:3717:	static unsigned char patterns[] =
drivers/cpufreq/intel_pstate.c:1515:	static int silvermont_freq_table[] = {
drivers/cpufreq/intel_pstate.c:1530:	static int airmont_freq_table[] = {
drivers/dma/xgene-dma.c:360:	static u8 flyby_type[] = {

Some of these could be const, but some could not.  For instance:

For drivers/acpi/apei/apei-base.c:781:	static u8 whea_uuid_str[] = "ed855e0c-6c90-47bf-a62a-26de0fc5ad5c";

whea_uuid_str is assigned as a reference in "int apei_osc_setup(void)"
a struct acpi_osc_context where .uuid_str is not declared as const char *.




