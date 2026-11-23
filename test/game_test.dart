import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cini_ustasi/oyun_cini_ustasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ciniUstasiConfig.title.length, 33);
    expect(ciniUstasiConfig.tagline.length, 33);
    for (final s in ciniUstasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ciniUstasiConfig.gameId, ciniUstasiId);
    expect(ciniUstasiRules.gameId, ciniUstasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ciniUstasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ciniUstasiId, optionalMechanics: ciniUstasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ciniUstasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
