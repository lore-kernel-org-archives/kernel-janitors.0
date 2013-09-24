From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 24 Sep 2013 18:38:13 +0000
Subject: build regressions 2013-09-24
Message-Id: <5241dc15.3JBGUXW9P8+5ptqu%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/built-in.o:(.data+0xc04): undefined reference to `sysctl_clear_threshold'
drivers/iio/kfifo_buf.c:12:20: error: field 'buffer' has incomplete type
drivers/iio/kfifo_buf.c:39:3: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:46:10: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:53:3: error: 'dev_attr_length' undeclared here (not in a function)
drivers/iio/kfifo_buf.c:54:3: error: 'dev_attr_enable' undeclared here (not in a function)
drivers/iio/kfifo_buf.c:65:10: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:65:10: error: request for member 'bytes_per_datum' in something not a structure or union
include/linux/kernel.h:783:27: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/iio/kfifo_buf.c:77:7: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:77:7: error: request for member 'bytes_per_datum' in something not a structure or union
drivers/iio/kfifo_buf.c:78:4: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:78:4: error: request for member 'bytes_per_datum' in something not a structure or union
drivers/iio/kfifo_buf.c:89:7: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:89:7: error: request for member 'length' in something not a structure or union
drivers/iio/kfifo_buf.c:90:4: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:90:4: error: request for member 'length' in something not a structure or union
include/linux/kernel.h:783:27: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/iio/kfifo_buf.c:104:3: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:104:3: error: request for member 'stufftoread' in something not a structure or union
drivers/iio/kfifo_buf.c:105:26: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:105:26: error: request for member 'pollq' in something not a structure or union
include/linux/kernel.h:783:27: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/iio/kfifo_buf.c:116:11: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:116:11: error: request for member 'bytes_per_datum' in something not a structure or union
drivers/iio/kfifo_buf.c:116:33: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:116:33: error: request for member 'bytes_per_datum' in something not a structure or union
drivers/iio/kfifo_buf.c:124:4: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:124:4: error: request for member 'stufftoread' in something not a structure or union
drivers/iio/kfifo_buf.c:127:4: error: dereferencing pointer to incomplete type
drivers/iio/kfifo_buf.c:127:4: error: request for member 'stufftoread' in something not a structure or union
drivers/iio/kfifo_buf.c:132:21: error: variable 'kfifo_access_funcs' has initializer but incomplete type
drivers/iio/kfifo_buf.c:133:2: error: unknown field 'store_to' specified in initializer
drivers/iio/kfifo_buf.c:134:2: error: unknown field 'read_first_n' specified in initializer
drivers/iio/kfifo_buf.c:135:2: error: unknown field 'request_update' specified in initializer
drivers/iio/kfifo_buf.c:136:2: error: unknown field 'get_bytes_per_datum' specified in initializer
drivers/iio/kfifo_buf.c:137:2: error: unknown field 'set_bytes_per_datum' specified in initializer
drivers/iio/kfifo_buf.c:138:2: error: unknown field 'get_length' specified in initializer
drivers/iio/kfifo_buf.c:139:2: error: unknown field 'set_length' specified in initializer
drivers/iio/kfifo_buf.c:150:2: error: implicit declaration of function 'iio_buffer_init' [-Werror=implicit-function-declaration]
drivers/iio/kfifo_buf.c:151:12: error: request for member 'attrs' in something not a structure or union
drivers/iio/kfifo_buf.c:152:12: error: request for member 'access' in something not a structure or union
drivers/iio/kfifo_buf.c:153:12: error: request for member 'length' in something not a structure or union
include/linux/kernel.h:783:27: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/staging/iio/iio_simple_dummy_buffer.c:111:16: error: 'iio_sw_buffer_preenable' undeclared here (not in a function)
drivers/staging/iio/iio_simple_dummy_buffer.c:144:8: error: dereferencing pointer to incomplete type
drivers/iio/adc/ti_am335x_adc.c:150:3: error: implicit declaration of function 'iio_push_to_buffers' [-Werror=implicit-function-declaration]
drivers/iio/adc/ti_am335x_adc.c:173:2: error: implicit declaration of function 'iio_sw_buffer_preenable' [-Werror=implicit-function-declaration]
drivers/iio/adc/ti_am335x_adc.c:184:30: error: dereferencing pointer to incomplete type
drivers/iio/adc/ti_am335x_adc.c:184:30: error: dereferencing pointer to incomplete type
drivers/staging/iio/iio_simple_dummy_buffer.c:86:2: error: implicit declaration of function 'iio_push_to_buffers_with_timestamp' [-Werror=implicit-function-declaration]
drivers/iio/kfifo_buf.c:50:8: error: type defaults to 'int' in declaration of 'IIO_BUFFER_ENABLE_ATTR' [-Werror=implicit-int]
drivers/iio/kfifo_buf.c:51:8: error: type defaults to 'int' in declaration of 'IIO_BUFFER_LENGTH_ATTR' [-Werror=implicit-int]

[warnings]
include/linux/kernel.h:782:48: warning: (near initialization for 'buf') [enabled by default]
drivers/iio/kfifo_buf.c:65:2: warning: return makes integer from pointer without a cast [enabled by default]
include/linux/kernel.h:782:48: warning: (near initialization for 'kf') [enabled by default]
drivers/iio/kfifo_buf.c:77:25: warning: comparison between pointer and integer [enabled by default]
drivers/iio/kfifo_buf.c:78:3: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:89:16: warning: comparison between pointer and integer [enabled by default]
drivers/iio/kfifo_buf.c:90:3: warning: statement with no effect [-Wunused-value]
include/linux/kernel.h:782:48: warning: (near initialization for 'kf') [enabled by default]
drivers/iio/kfifo_buf.c:104:2: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:105:2: warning: passing argument 1 of '__wake_up' from incompatible pointer type [enabled by default]
include/linux/kernel.h:782:48: warning: (near initialization for 'kf') [enabled by default]
drivers/iio/kfifo_buf.c:116:8: warning: comparison between pointer and integer [enabled by default]
drivers/iio/kfifo_buf.c:124:3: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:127:3: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:133:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:133:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:134:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:134:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:135:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:135:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:136:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:136:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:137:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:137:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:138:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:138:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:139:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/kfifo_buf.c:139:2: warning: (near initialization for 'kfifo_access_funcs') [enabled by default]
drivers/iio/kfifo_buf.c:151:2: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:152:2: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:153:2: warning: statement with no effect [-Wunused-value]
drivers/iio/kfifo_buf.c:154:2: warning: return from incompatible pointer type [enabled by default]
drivers/iio/kfifo_buf.c:49:8: warning: 'IIO_BUFFER_ENABLE_ATTR' defined but not used [-Wunused-variable]
drivers/iio/kfifo_buf.c:50:8: warning: 'IIO_BUFFER_LENGTH_ATTR' defined but not used [-Wunused-variable]
warning: (AD5933 && IIO_SIMPLE_DUMMY_BUFFER && TI_AM335X_ADC) selects IIO_KFIFO_BUF which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD5933 && IIO_SIMPLE_DUMMY_BUFFER && TI_AM335X_ADC) selects IIO_KFIFO_BUF which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD5933 && IIO_SIMPLE_DUMMY_BUFFER && TI_AM335X_ADC) selects IIO_KFIFO_BUF which has unmet direct dependencies (IIO && IIO_BUFFER)

[sparse]
drivers/net/bonding/bond_alb.c:1670:9: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/bonding/bond_alb.c:1670:9: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/bonding/bond_alb.c:1670:9: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/bonding/bond_alb.c:1670:9: sparse: incompatible types in comparison expression (different address spaces)
arch/x86/platform/uv/uv_nmi.c:41:5: sparse: symbol 'uv_handle_nmi' was not declared. Should it be static?
arch/x86/platform/uv/uv_nmi.c:511:5: sparse: symbol 'uv_handle_nmi_ping' was not declared. Should it be static?
arch/x86/platform/uv/uv_nmi.c:192:12: sparse: context imbalance in 'uv_check_nmi' - different lock contexts for basic block
arch/x86/include/asm/uv/uv_hub.h:473:16: sparse: context imbalance in 'uv_handle_nmi' - unexpected unlock
mm/highmem.c:457:19: sparse: symbol 'sysctl_clear_threshold' was not declared. Should it be static?
drivers/acpi/acpica/acglobal.h:272:42: sparse: symbol 'acpi_gbl_sci_handler_list' was not declared. Should it be static?

[coccinelle]
crypto/ablk_helper.c:97:2-8: Replace memcpy with struct assignment
crypto/ablk_helper.c:78:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
