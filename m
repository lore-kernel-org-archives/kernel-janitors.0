Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2CAEB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Jul 2023 08:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGGIoN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Jul 2023 04:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjGGIoM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jul 2023 04:44:12 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 479E31FD8;
        Fri,  7 Jul 2023 01:44:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 71567603362EB;
        Fri,  7 Jul 2023 16:43:50 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, x86@kernel.org
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: [PATCH] KVM: VMX: Avoid noinstr warning
Date:   Fri,  7 Jul 2023 16:43:28 +0800
Message-Id: <20230707084328.2563454-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x2d8:
call to vmread_error_trampoline() leaves .noinstr.text section

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 arch/x86/kvm/vmx/vmx_ops.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/vmx/vmx_ops.h b/arch/x86/kvm/vmx/vmx_ops.h
index ce47dc265f89..54f86ce2ad60 100644
--- a/arch/x86/kvm/vmx/vmx_ops.h
+++ b/arch/x86/kvm/vmx/vmx_ops.h
@@ -112,6 +112,7 @@ static __always_inline unsigned long __vmcs_readl(unsigned long field)
 
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 
+	instrumentation_begin();
 	asm volatile("1: vmread %2, %1\n\t"
 		     ".byte 0x3e\n\t" /* branch taken hint */
 		     "ja 3f\n\t"
@@ -139,6 +140,7 @@ static __always_inline unsigned long __vmcs_readl(unsigned long field)
 		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_ONE_REG, %1)
 
 		     : ASM_CALL_CONSTRAINT, "=&r"(value) : "r"(field) : "cc");
+	instrumentation_end();
 	return value;
 
 #endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
-- 
2.30.2

