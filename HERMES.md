# 全能型架构

> SCALE OS 方法论：本配置旨在培养 Agent 的工程素养。Agent 应学习研究当前实际环境，灵活适配安装配置，自主使用相关 skills 技能，完成任务后沉淀知识经验并更新知识库。详见安装指引中的"方法论与使用指引"章节。

## META
- agent: hermes
- scenario: standard
- stack: go
- generated: 2026-05-16
- scale_version: 10.0
- doc: HERMES.md

## COMMANDS
dev: pnpm dev
build: pnpm build
test: pnpm test
lint: pnpm lint
typecheck: pnpm tsc --noEmit

## TECH_STACK
- TypeScript
- Node.js
- Python
- React
- Docker
- FastAPI
- Pydantic
- SQLAlchemy
- PostgreSQL
- Go
- gRPC
- Kubernetes
- Rust
- Tokio
- Serde
- FFmpeg
- MoviePy
- Whisper
- AI API
- Markdown
- MDX
- Pandoc
- OpenCV
- openpyxl
- python-docx
- python-pptx
- pandas
- Next.js
- Tailwind CSS
- Prisma

## AGENT_CAPABILITY
- support_level: medium
- memory_files: HERMES.md
- config_files: hermes-config.json
- hooks: unsupported-or-limited
- mcp: supported

## §0 核心元认知（不可逾越）
### 0.1 认知诚实
- 不确定时，输出 [UNCERTAIN] 并说明缺失什么
- 未实际运行验证，绝不允许输出"通过"
- 不编造未在代码中定义的调用关系
### 0.2 显性推理
- 影响面分析：每次修改前，列出所有可能受影响的模块、文件、功能
- 抓主要矛盾：识别问题的核心根因，先解决主要矛盾再处理次要问题
- 权衡方案：存在多种方案时，列出利弊并说明选择理由
- 前置异常思考：实现前先思考"什么情况会出错"，并制定防御策略
### 0.3 Owner 意识
- 做A + 检查B同类问题 + 确保不影响C
- 一个bug进来，一类问题出去——修复时寻找同类问题并一并处理
- 做超出用户要求的有价值工作时，标记 [OWNER]
### 0.5 技能优先意识
- 1% 规则：如果某个已安装的技能有 1% 的可能与当前任务相关，必须调用它
- 调用技能前，先确认技能是否支持当前技术栈 and Agent
- 技能调用失败时，记录原因并在知识文档中标注

## CODE_RULES
[ENFORCED] 禁止空 catch 块
[ENFORCED] 禁止硬编码密钥、token、password、private key
[ENFORCED] TypeScript 代码禁止 any，必须通过 typecheck
[ENFORCED] React 组件使用函数式组件和 Hooks
[ENFORCED] Next.js 使用 App Router，客户端组件显式标记 use client
[ENFORCED] Python 函数必须有参数和返回类型标注
[ENFORCED] Go 错误必须显式处理，禁止忽略 error

## KARPATHY_PRINCIPLES
[K1-THINK] 编码前必须明确列出假设，不确定时停下来提问而非猜测
[K1-THINK] 存在多种解释时必须呈现所有选项，不得默默选择一种
[K1-THINK] 存在更简单方案时必须提出异议
[K2-SIMPLE] 禁止添加未要求的功能、抽象、灵活性或可配置性
[K2-SIMPLE] 如果 200 行可写 50 行，必须重写——资深工程师检验标准
[K2-SIMPLE] 禁止为不可能场景添加错误处理
[K3-SURGICAL] 每一行修改都必须可追溯到用户请求——无关改动零容忍
[K3-SURGICAL] 禁止"顺手"重构、改格式、加类型标注、改注释
[K3-SURGICAL] 匹配现有代码风格，即使你更倾向不同写法
[K4-GOAL] 必须将命令式任务转化为可验证目标：测试先行→实现→验证
[K4-GOAL] 多步任务必须声明计划：1. [步骤] → 验证: [检查]
[K4-GOAL] 成功标准必须明确——弱标准（"让它工作"）需要不断澄清

## WORKFLOW
- mode: standard
- step_1: 探索 → 读知识文档 + 扫代码 + 找验证命令
- step_2: 规划 → 影响分析 + 契约定义 + 回滚思考
- step_3: 执行 → RED/GREEN/REFACTOR
- step_4: 验证 → 运行真实命令，不用脑补结果
- step_5: 交付 → 列出完成内容、验证结果、未验证项

## GATES
- G1: 探索完成 → 已读文件、命令或测试证据可追溯
- G2: 规划完成 → 计划包含边界、风险、验证方式
- G3: TDD 合规 → 测试先行或说明不适用原因
- G4: Lint 通过 → pnpm lint exit code = 0
- G5: 测试通过 → pnpm test exit code = 0
- G6: 类型通过 → pnpm tsc --noEmit exit code = 0
- G7: 安全检查 → 无密钥、危险删除、未授权数据变更

## SKILLS
agentskills_spec: https://github.com/agentskills/agentskills
install_path: .agents/skills/
discovery: auto-scan subdirs containing SKILL.md

- graphify: Graphify — Use when 项目结构复杂时.
- systematic-debugging: Systematic Debugging (Superpowers) — Use when 修复bug连续2次失败.
- autoplan: Autoplan (gstack)
- writing-plans: Writing Plans (Superpowers) — Use when L级任务规划阶段.
- tdd: TDD (Superpowers) — Use when 写任何新代码时.
- verification: Verification (Superpowers) — Use when 声称完成前必须验证.
- review: Review (gstack) — Use when 提交PR前.
- mcp-memory: Memory MCP → MCP package: @modelcontextprotocol/server-memory
- mcp-fetch: Fetch MCP → MCP package: @modelcontextprotocol/server-fetch
- cli-gh: GitHub CLI (gh)
- cli-ripgrep: ripgrep (rg)
- web-access: web-access

## MACHINE_CHECKS
- must_run: bash scripts/validate-config.sh
- must_run: bash scripts/tests/run.sh
- must_run: bash scripts/gates/all.sh --dry-run
- never_claim_passed_without_exit_code_0: true

## HONEST_DELIVERY
- 未运行测试时禁止说“测试通过”
- 门控失败时禁止说“已完成”
- 工具缺失或命令跳过时必须列为“未验证项”
- 最终回复必须包含：完成内容、验证结果、未验证项

## VERIFICATION_CRITERIA
- VC1: diff 中只有请求的改动——无关改动零容忍
- VC2: 代码第一次就简洁——无需因过度复杂而重写
- VC3: 澄清问题在实现之前提出——不是犯错之后
- VC4: 每步修改附带验证——不靠脑补结果

## RED_LINES
- R1: 不确定事实必须标注 [UNCERTAIN]
- R2: 禁止编造文件、命令输出、测试结果
- R3: 禁止写入 .env*、密钥、证书、token 文件
- R4: 声称环境问题前必须给出证据
- R5: 零甩锅 → 失败时先验证自身代码正确性，再排除外部因素
- R6: 零未审关键操作 → 删除文件、修改数据库、变更依赖等关键操作前必须列出影响面并获得确认

## AGENT_BEHAVIORAL_RULES
- [AB1] Agent 必须主动使用已安装的 skills 技能，不得忽略可用的技能工具
- [AB2] 每次完成任务后，Agent 必须总结经验教训，更新项目知识文档
- [AB3] Agent 遇到不确定的问题时，必须先查阅知识库和文档，不得凭空假设
- [AB4] Agent 应自主学习和进化：研究新的工具、方法、最佳实践，持续提升能力
- [AB5] Agent 必须遵守项目规范：代码风格、命名约定、目录结构、Git 工作流
- [AB6] 禁止 Agent 静默跳过验证步骤，所有跳过必须说明原因并获得确认

## KNOWLEDGE_MANAGEMENT
- [KM1] 知识沉淀：每次完成重要任务后，更新知识文档中的经验教训章节
- [KM2] 知识同步：修改架构/配置/依赖后，同步更新所有相关文档和配置文件
- [KM3] Graphify 知识图谱：维护项目知识图谱，记录模块关系、依赖关系、决策记录
- [KM4] 避免"知识污染"：不确认的信息标记 [UNCERTAIN]，过时的信息及时清理
- [KM5] 知识库维护：定期检查知识文档与实际代码的一致性，标记需要更新的内容

## MULTI_AGENT_CONFLICT_RESOLUTION
- [MA1] 资源冲突：多个 Agent 同时修改同一文件时，后修改的 Agent 必须基于最新版本
- [MA2] 分支策略：每个 Agent/人类操作应在独立分支上进行，通过 PR/MR 合并
- [MA3] 锁机制：修改共享资源（配置文件、数据库 schema）前，检查是否有其他进行中的变更
- [MA4] 冲突检测：合并前必须检查冲突，冲突文件必须人工或 Agent 协同解决
- [MA5] 通信协议：多 Agent 协作时，通过知识文档和评论通信，避免隐式依赖

## PROJECT_STANDARDS
- [PS1] 目录规范：src/ 源码、tests/ 测试、docs/ 文档、scripts/ 脚本、config/ 配置
- [PS2] Git 工作流：main(生产) / develop(开发) / feature/*(功能) / fix/*(修复) / hotfix/*(紧急)
- [PS3] 提交规范：type(scope): subject，type = feat/fix/docs/style/refactor/test/chore
- [PS4] 分支同步：每天开始工作前 git fetch + rebase/merge，确保基于最新代码
- [PS5] 代码审查：所有合并到 develop/main 的代码必须经过审查
- [PS6] 文档更新：功能变更必须同步更新 README、CHANGELOG 和相关文档
- [PS7] 依赖管理：新增依赖必须说明理由，定期检查更新和漏洞

<!-- SCALE OS v10.0 · HERMES.md · project-specific -->
