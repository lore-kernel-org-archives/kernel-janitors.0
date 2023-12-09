Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="R0ivJdUO"
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF3410E6
	for <kernel-janitors@vger.kernel.org>; Sat,  9 Dec 2023 04:36:31 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id BwZ7rbI0E6wd8BwZFre9vu; Sat, 09 Dec 2023 13:36:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702125391;
	bh=8H4ZD3O2zM53FOpfQ60afkiHrSEs0SVvh7G9x7C42wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R0ivJdUOrY6nEVb3Z2TcN+w3sallr2i/MWL/1LqnVQhXgXfiaYQPJTsEblBGh6LYw
	 jCOhxqfxgkYyGsYcexTGlh+Gtg5aH+THs0dTjbssiif/t81aC6vuPLtzJTQWZaTB/8
	 iiCtD/mnGj7kUxMgASTZmka7MpYUB0J8sbHopyG9Am/VRPqRQKjOHSjfL8gRKkhMgo
	 FpPy/OpDlOZ2SLxTejJ9TVw+JYWolOCknirLcQ610e3MRTgASocZ9TeCdbNyXK8WUs
	 49mJ1Bo5D1g8JUUyxDVY6XQDZGElEwL44q8mAghOKQibFDNB+Ry1dvd9sTv5LiV7yu
	 PjHiT91ixwZng==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 09 Dec 2023 13:36:28 +0100
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
Subject: [PATCH v2 2/2] VMCI: Remove VMCI_HANDLE_ARRAY_HEADER_SIZE and VMCI_HANDLE_ARRAY_MAX_CAPACITY
Date: Sat,  9 Dec 2023 13:36:15 +0100
Message-Id: <00547fe74efe329b266eb8074c41f286758a3c64.1702125347.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84e7f2d8e7c4c2eab68f958307d56546978f76e3.1702125347.git.christophe.jaillet@wanadoo.fr>
References: <84e7f2d8e7c4c2eab68f958307d56546978f76e3.1702125347.git.christophe.jaillet@wanadoo.fr>
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
Reviewed-by: Kees Cook <keescook@chromium.org>
---
Changes in v2:
   - no change in code
   - add R-b

v1: https://lore.kernel.org/all/c2a231a5ea127b28b5d8c4e86ef471dd01069d47.1702068153.git.christophe.jaillet@wanadoo.fr/
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

