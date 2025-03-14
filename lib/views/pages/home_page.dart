import 'package:chatbot_ai/cubit/chat_bot/chat_bot_cubit.dart';
import 'package:chatbot_ai/utils/theme/font_helper.dart';
import 'package:chatbot_ai/views/widgets/body_of_chat_bot.dart';
import 'package:chatbot_ai/views/widgets/bottom_nav_bar.dart';
import 'package:chatbot_ai/views/widgets/default_app_bar.dart';
import 'package:chatbot_ai/views/widgets/initial_home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final ScrollController _scrollController = ScrollController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ChatBotCubit>(context).startChattingSession();
    super.initState();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        debugPrint("✅ Scrolled to bottom!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatBotCubit>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 243, 238, 238),
      appBar: DefaultAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h, bottom: 12.h),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBotCubit, ChatBotState>(
                  bloc: chatCubit,
                  buildWhen: (previous, current) =>
                      current is ChatBotLoaded ||
                      current is MessageSent ||
                      current is MessageSentError,
                  builder: (context, state) {
                    if (state is ChatBotLoaded) {
                      _scrollToBottom();
                      return BodyOfChatBot(
                        scrollController: _scrollController,
                        messages: state.messages,
                      );
                    } else {
                      return InitialHomeBody();
                    }
                  },
                ),
              ),
              SizedBox(height: 8.h),
              BottomNavBar(),
              SizedBox(height: 6.h),
              Text(
                "Gemini can make mistakes, so double-check it",
                style:
                    FontHelper.fontText(13.sp, FontWeight.normal, Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
