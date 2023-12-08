Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="eDRVITlZ"
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E7819A5
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 12:46:24 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id BhjkrXIBfToaHBhjrr2fhc; Fri, 08 Dec 2023 21:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702068384;
	bh=OUm2hzTidMbVdw5ax/yHOZYECAzHPDWlYlnEDUQbJ6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eDRVITlZravmpDCqVEtKjoVG/CMGGLp20GLTLwVo/LflmiG3NNaPOOQlAGfd29KCP
	 wgg8XW//4KTUZVX0hVOcxlorSgosDdTLSuvmDIgpAEB7BoZ2rZHQowvuGfCEObI/vm
	 f0Nw4O9zwclo1iVHjfeUYWKqFl1UwiM9tOhF5cVHRUUBcibJW7wVipBdIfNDPg9sTz
	 8JSFq3LaLDdsi4HBpFOnlFo6Xv9ptREmVJuZDHOaxI+HCxDCx5icQwjkA7yf/KeNAD
	 al34aO70NpNPYuUUkmdOgk2P98Vzfdwu8RZ1J1btEqLIHqMZ/GfqSDej9fs7j9ujBI
	 fTdnw4DoPdM4g==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 08 Dec 2023 21:46:24 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bryan Tan <bryantan@vmware.com>,
	Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/2] VMCI: Remove VMCI_HANDLE_ARRAY_HEADER_SIZE and VMCI_HANDLE_ARRAY_MAX_CAPACITY
Date: Fri,  8 Dec 2023 21:46:10 +0100
Message-Id: <c2a231a5ea127b28b5d8c4e86ef471dd01069d47.1702068153.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
References: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove VMCI_HANDLE_ARRAY_HEADER_SIZE and VMCI_HANDLE_ARRAY_MAX_CAPACITY
that are unused.

Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/vmw_vmci/vmci_handle_array.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_handle_array.h b/drivers/misc/vmw_vmci/vmci_handle_array.h
index b0e6b1956014..27a38b97e8a8 100644
--- a/drivers/misc/vmw_vmci/vmci_handle_array.h
+++ b/drivers/misc/vmw_vmci/vmci_handle_array.h
@@ -20,14 +20,8 @@ struct vmci_handle_arr {
 	struct vmci_handle entries[] __counted_by(capacity);
 };
 
-#define VMCI_HANDLE_ARRAY_HEADER_SIZE				\
-	offsetof(struct vmci_handle_arr, entries)
 /* Select a default capacity that results in a 64 byte sized array */
 #define VMCI_HANDLE_ARRAY_DEFAULT_CAPACITY			6
-/* Make sure that the max array size can be expressed by a u32 */
-#define VMCI_HANDLE_ARRAY_MAX_CAPACITY				\
-	((U32_MAX - VMCI_HANDLE_ARRAY_HEADER_SIZE - 1) /	\
-	sizeof(struct vmci_handle))
 
 struct vmci_handle_arr *vmci_handle_arr_create(u32 capacity, u32 max_capacity);
 void vmci_handle_arr_destroy(struct vmci_handle_arr *array);
-- 
2.34.1

